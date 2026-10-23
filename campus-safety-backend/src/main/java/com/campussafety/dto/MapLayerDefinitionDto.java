package com.campussafety.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MapLayerDefinitionDto {
    private Long id;
    private String layerKey;
    private String name;
    private String urlTemplate;
    private String subdomains;
    private Integer minZoom;
    private Integer maxZoom;
    private Integer zOrder;
    private Boolean defaultVisible;
    private Double defaultOpacity;
    private Boolean enabled;
    private String credit;
    private Boolean visible;
    private Double opacity;
}
