package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "safety_points")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SafetyPoint {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String name;

    // 安全点位类型
    @Column(nullable = false, length = 30)
    @Enumerated(EnumType.STRING)
    private PointType type;

    private Double lng;
    private Double lat;

    // 所在楼层（0表示室外）
    private Integer floor;

    private Long buildingId;
    private Long campusId;

    // 状态
    @Column(length = 20)
    @Enumerated(EnumType.STRING)
    private PointStatus status;

    // 描述
    @Column(length = 500)
    private String description;

    // 图标URL
    @Column(length = 500)
    private String iconUrl;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (status == null) status = PointStatus.NORMAL;
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    public enum PointType {
        FIRE_HYDRANT,     // 消防栓
        FIRE_EXTINGUISHER,// 灭火器
        AED,              // AED除颤仪
        SHELTER,          // 避难所
        EXIT,             // 安全出口
        CAMERA,           // 监控摄像头
        ALARM_BUTTON,     // 报警按钮
        FIRST_AID,        // 急救箱
        ASSEMBLY_POINT    // 集合点
    }

    public enum PointStatus {
        NORMAL,    // 正常
        WARNING,   // 异常警告
        DISABLED   // 停用
    }
}
