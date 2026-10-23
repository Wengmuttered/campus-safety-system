package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;

/**
 * 地图在线底图/影像层配置（顺序由 zOrder 控制：数值小的先绘制在底层，大的在上层）
 */
@Entity
@Table(name = "map_layer_definitions")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MapLayerDefinition {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /** 唯一键，如 tianditu-vec */
    @Column(nullable = false, unique = true, length = 64)
    private String layerKey;

    @Column(nullable = false, length = 100)
    private String name;

    /** UrlTemplate，支持 {z}{x}{y}{s}；天地图 token 用占位符 __TK__，由服务端替换 */
    @Column(nullable = false, length = 2000)
    private String urlTemplate;

    /** 子域，逗号分隔，如 0,1,2,3,4,5,6,7 对应 t{s} */
    @Column(length = 64)
    private String subdomains;

    @Column(nullable = false)
    private Integer minZoom;

    @Column(nullable = false)
    private Integer maxZoom;

    /** 越小越在底层；影像层应大于矢量底图以叠在上面 */
    @Column(nullable = false)
    private Integer zOrder;

    @Column(nullable = false)
    private Boolean defaultVisible;

    @Column(nullable = false)
    private Double defaultOpacity;

    @Column(nullable = false)
    private Boolean enabled;

    @Column(length = 500)
    private String credit;

    /** 当前可见（用户可调，持久化） */
    @Column(nullable = false)
    private Boolean visible;

    /** 当前透明度 0~1 */
    @Column(nullable = false)
    private Double opacity;
}
