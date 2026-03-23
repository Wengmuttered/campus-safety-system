package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "campuses")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Campus {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String name;

    @Column(length = 500)
    private String address;

    // 中心经度
    private Double centerLng;

    // 中心纬度
    private Double centerLat;

    // 默认视角高度(米)
    private Double defaultAltitude;

    // 校区边界（GeoJSON格式字符串）
    @Column(columnDefinition = "TEXT")
    private String boundaryGeoJson;

    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}
