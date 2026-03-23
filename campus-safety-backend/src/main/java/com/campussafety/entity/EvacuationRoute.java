package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "evacuation_routes")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EvacuationRoute {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String name;

    private Long buildingId;
    private Long campusId;

    // 起点楼层
    private Integer startFloor;

    // 路线坐标点集（JSON数组格式 [[lng,lat,alt], ...]）
    @Column(columnDefinition = "TEXT")
    private String routePointsJson;

    // 路线长度（米）
    private Double distance;

    // 预计疏散时间（秒）
    private Integer estimatedTime;

    // 最大通行容量
    private Integer capacity;

    // 是否无障碍通道
    private Boolean accessible;

    @Column(length = 500)
    private String description;

    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        if (accessible == null) accessible = false;
    }
}
