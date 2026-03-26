package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "hazard_reports")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HazardReport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 200)
    private String title;

    @Column(nullable = false, length = 30)
    @Enumerated(EnumType.STRING)
    private HazardType type;

    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private HazardLevel level;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(length = 200)
    private String locationDesc;

    private Double lng;
    private Double lat;

    @Column(columnDefinition = "TEXT")
    private String images; // JSON: 图片URL列表

    private Long reporterId;
    private Long assigneeId;
    private Long campusId;

    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private HazardStatus status;

    private LocalDateTime deadline;

    @Column(columnDefinition = "TEXT")
    private String rectificationPlan;

    @Column(columnDefinition = "TEXT")
    private String rectificationResult;

    private Long verifierId;
    private LocalDateTime verifiedAt;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (status == null) status = HazardStatus.REPORTED;
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    public enum HazardType {
        FIRE,           // 火灾隐患
        ELECTRICAL,     // 电气隐患
        BUILDING,       // 建筑隐患
        CHEMICAL,       // 化学品隐患
        TRAFFIC,        // 交通隐患
        FOOD,           // 食品安全
        OTHER           // 其他
    }

    public enum HazardLevel {
        MINOR,          // 一般隐患
        MAJOR,          // 较大隐患
        CRITICAL        // 重大隐患
    }

    public enum HazardStatus {
        REPORTED,       // 已上报
        CONFIRMED,      // 已确认
        RECTIFYING,     // 整改中
        RECTIFIED,      // 已整改
        VERIFIED,       // 已验收
        CLOSED          // 已关闭
    }
}
