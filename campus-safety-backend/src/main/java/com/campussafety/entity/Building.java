package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "buildings")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Building {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String name;

    private Long campusId;

    // 建筑经度
    private Double lng;

    // 建筑纬度
    private Double lat;

    // 建筑高度(米)
    private Double height;

    // 楼层数
    private Integer floorCount;

    // 建筑类型
    @Column(length = 50)
    private String buildingType;

    // 3D模型URL（GLTF/GLB格式）
    @Column(length = 500)
    private String modelUrl;

    // 建筑轮廓（GeoJSON格式）
    @Column(columnDefinition = "TEXT")
    private String footprintGeoJson;

    // 最大容纳人数
    private Integer capacity;

    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}
