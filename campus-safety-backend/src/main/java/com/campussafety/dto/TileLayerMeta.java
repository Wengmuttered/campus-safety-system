package com.campussafety.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class TileLayerMeta {
    private String layer;
    private boolean available;
    private String format;
    private Integer minZoom;
    private Integer maxZoom;
    private String bounds;
    private Long tileCount;
    private String attribution;
    private String sourceFile;
}
