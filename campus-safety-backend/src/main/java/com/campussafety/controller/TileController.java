package com.campussafety.controller;

import com.campussafety.dto.TileMetaResponse;
import com.campussafety.service.OfflineTileService;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Duration;
import java.util.Optional;

@RestController
@RequestMapping("/api/tiles")
@RequiredArgsConstructor
public class TileController {

    private final OfflineTileService offlineTileService;

    @GetMapping("/meta")
    public ApiResponse<TileMetaResponse> getMeta() {
        return ApiResponse.success(offlineTileService.getMeta());
    }

    @GetMapping("/{layer}/{z}/{x}/{y}")
    public ResponseEntity<byte[]> getTile(@PathVariable String layer,
                                          @PathVariable int z,
                                          @PathVariable int x,
                                          @PathVariable int y,
                                          @RequestHeader(value = HttpHeaders.ACCEPT_ENCODING, required = false) String acceptEncoding) {
        Optional<OfflineTileService.TilePayload> payload = offlineTileService.getTile(layer, z, x, y, acceptEncoding);
        if (payload.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        OfflineTileService.TilePayload tilePayload = payload.get();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.parseMediaType(tilePayload.contentType()));
        headers.setCacheControl(CacheControl.maxAge(Duration.ofDays(30)).cachePublic().immutable());
        headers.add(HttpHeaders.VARY, HttpHeaders.ACCEPT_ENCODING);
        if (tilePayload.gzipped()) {
            headers.add(HttpHeaders.CONTENT_ENCODING, "gzip");
        }
        return ResponseEntity.ok().headers(headers).body(tilePayload.data());
    }
}
