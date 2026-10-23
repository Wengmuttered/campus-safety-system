package com.campussafety.dto;

import lombok.Builder;
import lombok.Data;

import java.util.Map;

@Data
@Builder
public class TileMetaResponse {
    private boolean enabled;
    private String dataDir;
    private String defaultLayer;
    private String generatedAt;
    private Map<String, TileLayerMeta> layers;
}
