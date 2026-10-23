package com.campussafety.service;

import com.campussafety.config.TileProperties;
import com.campussafety.dto.TileLayerMeta;
import com.campussafety.dto.TileMetaResponse;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.OffsetDateTime;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.zip.GZIPOutputStream;

@Service
@Slf4j
@RequiredArgsConstructor
public class OfflineTileService {

    public record TilePayload(byte[] data, String contentType, boolean gzipped) {}

    private final TileProperties tileProperties;

    private Path resolvedDataDir;
    private Map<String, CacheEntry> tileCache;
    private Set<String> allowedLayers;
    private int cacheLimit;

    @PostConstruct
    public void init() {
        cacheLimit = Math.max(tileProperties.getCacheSize(), 256);
        tileCache = Collections.synchronizedMap(new LinkedHashMap<>(512, 0.75f, true) {
            @Override
            protected boolean removeEldestEntry(Map.Entry<String, CacheEntry> eldest) {
                return size() > cacheLimit;
            }
        });

        allowedLayers = new LinkedHashSet<>(tileProperties.getLayers().keySet());
        resolvedDataDir = Paths.get(tileProperties.getDataDir()).normalize().toAbsolutePath();
        log.info("[tiles] enabled={}, dataDir={}, layers={}",
            tileProperties.isEnabled(), resolvedDataDir, allowedLayers);
    }

    public TileMetaResponse getMeta() {
        Map<String, TileLayerMeta> layersMeta = new LinkedHashMap<>();
        for (String layer : allowedLayers) {
            layersMeta.put(layer, readLayerMeta(layer));
        }

        return TileMetaResponse.builder()
            .enabled(tileProperties.isEnabled())
            .dataDir(resolvedDataDir.toString())
            .defaultLayer(tileProperties.getDefaultLayer())
            .generatedAt(OffsetDateTime.now().toString())
            .layers(layersMeta)
            .build();
    }

    public Optional<TilePayload> getTile(String layer, int z, int x, int y, String acceptEncoding) {
        if (!tileProperties.isEnabled() || !isValidLayer(layer) || !isValidTileCoordinate(z, x, y)) {
            return Optional.empty();
        }

        String cacheKey = layer + ":" + z + ":" + x + ":" + y;
        CacheEntry fromCache = tileCache.get(cacheKey);
        if (fromCache == null) {
            fromCache = loadTile(layer, z, x, y);
            if (fromCache == null) {
                return Optional.empty();
            }
            tileCache.put(cacheKey, fromCache);
        }

        boolean canGzip = supportsGzip(acceptEncoding) && fromCache.rawData.length >= tileProperties.getGzipMinBytes();
        if (!canGzip) {
            return Optional.of(new TilePayload(fromCache.rawData, fromCache.contentType, false));
        }

        byte[] gzipped = gzip(fromCache.rawData);
        if (gzipped.length >= fromCache.rawData.length) {
            return Optional.of(new TilePayload(fromCache.rawData, fromCache.contentType, false));
        }
        return Optional.of(new TilePayload(gzipped, fromCache.contentType, true));
    }

    private CacheEntry loadTile(String layer, int z, int x, int y) {
        Path filePath = resolveLayerPath(layer);
        if (!Files.exists(filePath)) {
            return null;
        }

        long maxIndex = (1L << z) - 1L;
        int tmsY = (int) (maxIndex - y);
        String sql = "SELECT tile_data FROM tiles WHERE zoom_level=? AND tile_column=? AND tile_row=?";

        try (Connection connection = openConnection(filePath);
             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, z);
            ps.setInt(2, x);
            ps.setInt(3, tmsY);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) {
                    return null;
                }
                byte[] data = rs.getBytes(1);
                String contentType = detectContentType(layer, filePath, data);
                return new CacheEntry(data, contentType);
            }
        } catch (SQLException e) {
            log.warn("[tiles] query failed for {}/{}/{}/{}: {}", layer, z, x, y, e.getMessage());
            return null;
        }
    }

    private TileLayerMeta readLayerMeta(String layer) {
        Path filePath = resolveLayerPath(layer);
        if (!Files.exists(filePath)) {
            return TileLayerMeta.builder()
                .layer(layer)
                .available(false)
                .sourceFile(filePath.toString())
                .build();
        }

        String format = queryMetadata(filePath, "format");
        String bounds = queryMetadata(filePath, "bounds");
        String attribution = queryMetadata(filePath, "attribution");
        Integer minZoom = parseIntOrNull(queryMetadata(filePath, "minzoom"));
        Integer maxZoom = parseIntOrNull(queryMetadata(filePath, "maxzoom"));
        Long tileCount = queryTileCount(filePath);

        if (minZoom == null || maxZoom == null) {
            ZoomRange zoomRange = queryZoomRange(filePath);
            if (zoomRange != null) {
                if (minZoom == null) {
                    minZoom = zoomRange.minZoom;
                }
                if (maxZoom == null) {
                    maxZoom = zoomRange.maxZoom;
                }
            }
        }

        return TileLayerMeta.builder()
            .layer(layer)
            .available(true)
            .format(format)
            .minZoom(minZoom)
            .maxZoom(maxZoom)
            .bounds(bounds)
            .tileCount(tileCount)
            .attribution(attribution)
            .sourceFile(filePath.toString())
            .build();
    }

    private ZoomRange queryZoomRange(Path filePath) {
        String sql = "SELECT MIN(zoom_level) AS min_zoom, MAX(zoom_level) AS max_zoom FROM tiles";
        try (Connection connection = openConnection(filePath);
             PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (!rs.next()) {
                return null;
            }
            return new ZoomRange(rs.getInt("min_zoom"), rs.getInt("max_zoom"));
        } catch (SQLException e) {
            log.warn("[tiles] failed to query zoom range for {}: {}", filePath, e.getMessage());
            return null;
        }
    }

    private Long queryTileCount(Path filePath) {
        String sql = "SELECT COUNT(1) AS tile_count FROM tiles";
        try (Connection connection = openConnection(filePath);
             PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (!rs.next()) {
                return 0L;
            }
            return rs.getLong("tile_count");
        } catch (SQLException e) {
            log.warn("[tiles] failed to query tile count for {}: {}", filePath, e.getMessage());
            return 0L;
        }
    }

    private String queryMetadata(Path filePath, String key) {
        String sql = "SELECT value FROM metadata WHERE name=?";
        try (Connection connection = openConnection(filePath);
             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, key);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString(1);
                }
                return null;
            }
        } catch (SQLException e) {
            log.warn("[tiles] failed to query metadata {} for {}: {}", key, filePath, e.getMessage());
            return null;
        }
    }

    private String detectContentType(String layer, Path filePath, byte[] data) {
        if (data.length >= 4) {
            if ((data[0] & 0xFF) == 0x89 && data[1] == 'P' && data[2] == 'N' && data[3] == 'G') {
                return "image/png";
            }
            if ((data[0] & 0xFF) == 0xFF && (data[1] & 0xFF) == 0xD8) {
                return "image/jpeg";
            }
            if (data[0] == 'R' && data[1] == 'I' && data[2] == 'F' && data[3] == 'F') {
                return "image/webp";
            }
        }

        String metadataFormat = queryMetadata(filePath, "format");
        if ("jpg".equalsIgnoreCase(metadataFormat) || "jpeg".equalsIgnoreCase(metadataFormat)) {
            return "image/jpeg";
        }
        if ("webp".equalsIgnoreCase(metadataFormat)) {
            return "image/webp";
        }
        if ("png".equalsIgnoreCase(metadataFormat)) {
            return "image/png";
        }

        return "satellite".equalsIgnoreCase(layer) ? "image/jpeg" : "image/png";
    }

    private Connection openConnection(Path filePath) throws SQLException {
        return DriverManager.getConnection("jdbc:sqlite:" + filePath);
    }

    private boolean isValidLayer(String layer) {
        return StringUtils.hasText(layer) && allowedLayers.contains(layer);
    }

    private boolean isValidTileCoordinate(int z, int x, int y) {
        if (z < 0 || z > 22 || x < 0 || y < 0) {
            return false;
        }
        long maxIndex = (1L << z) - 1L;
        return x <= maxIndex && y <= maxIndex;
    }

    private boolean supportsGzip(String acceptEncoding) {
        return acceptEncoding != null && acceptEncoding.toLowerCase().contains("gzip");
    }

    private byte[] gzip(byte[] data) {
        try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
             GZIPOutputStream gzipStream = new GZIPOutputStream(outputStream)) {
            gzipStream.write(data);
            gzipStream.finish();
            return outputStream.toByteArray();
        } catch (IOException e) {
            return data;
        }
    }

    private Integer parseIntOrNull(String value) {
        if (!StringUtils.hasText(value)) {
            return null;
        }
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException ex) {
            return null;
        }
    }

    private Path resolveLayerPath(String layer) {
        String fileName = tileProperties.getLayers().get(layer);
        if (!StringUtils.hasText(fileName)) {
            return resolvedDataDir.resolve(layer + ".mbtiles");
        }
        return resolvedDataDir.resolve(fileName).normalize().toAbsolutePath();
    }

    private record CacheEntry(byte[] rawData, String contentType) {}

    private record ZoomRange(int minZoom, int maxZoom) {}
}
