package com.campussafety.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.LinkedHashMap;
import java.util.Map;

@Data
@ConfigurationProperties(prefix = "tiles")
public class TileProperties {
    private boolean enabled = true;
    private String dataDir = "../tools/offline_tiles/output";
    private String defaultLayer = "light";
    private int cacheSize = 4096;
    private int gzipMinBytes = 2048;
    private Map<String, String> layers = new LinkedHashMap<>(
        Map.of(
            "light", "light.mbtiles",
            "satellite", "satellite.mbtiles"
        )
    );
}
