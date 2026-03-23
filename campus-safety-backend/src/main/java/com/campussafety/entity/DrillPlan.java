package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "drill_plans")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DrillPlan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String name;

    // 演练场景类型
    @Column(nullable = false, length = 30)
    @Enumerated(EnumType.STRING)
    private ScenarioType scenarioType;

    private Long campusId;

    @Column(columnDefinition = "TEXT")
    private String description;

    // 参与人数
    private Integer participantCount;

    // 演练范围中心坐标
    private Double centerLng;
    private Double centerLat;
    private Double radius;

    // 计划时间
    private LocalDateTime scheduledAt;

    // 演练状态
    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private DrillStatus status;

    // 演练结果/总结
    @Column(columnDefinition = "TEXT")
    private String summary;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (status == null) status = DrillStatus.PLANNED;
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    public enum ScenarioType {
        FIRE,           // 消防演练
        EARTHQUAKE,     // 地震逃生
        FLOOD,          // 防洪演练
        CHEMICAL,       // 化学品事故
        COMPREHENSIVE   // 综合演练
    }

    public enum DrillStatus {
        PLANNED,        // 已规划
        IN_PROGRESS,    // 进行中
        COMPLETED,      // 已完成
        CANCELLED       // 已取消
    }
}
