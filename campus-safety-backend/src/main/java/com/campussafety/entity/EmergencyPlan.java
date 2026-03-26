package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "emergency_plans")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EmergencyPlan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 200)
    private String title;

    @Column(nullable = false, length = 30)
    @Enumerated(EnumType.STRING)
    private PlanType type;

    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private PlanLevel level;

    @Column(length = 20)
    private String version;

    @Column(columnDefinition = "TEXT")
    private String content; // 预案详细内容

    @Column(columnDefinition = "TEXT")
    private String procedures; // JSON: 处置流程步骤

    @Column(columnDefinition = "TEXT")
    private String departments; // JSON: 涉及部门

    @Column(columnDefinition = "TEXT")
    private String resources; // JSON: 所需资源

    @Column(length = 500)
    private String attachmentUrl;

    private Long campusId;
    private Long createdBy;
    private Long approvedBy;

    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private PlanStatus status;

    private LocalDateTime publishedAt;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (status == null) status = PlanStatus.DRAFT;
        if (version == null) version = "1.0";
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    public enum PlanType {
        FIRE,               // 火灾应急预案
        EARTHQUAKE,         // 地震应急预案
        FLOOD,              // 防洪应急预案
        CHEMICAL,           // 化学品事故预案
        PUBLIC_HEALTH,      // 公共卫生预案
        VIOLENCE,           // 暴力事件预案
        CROWD,              // 群体事件预案
        COMPREHENSIVE       // 综合应急预案
    }

    public enum PlanLevel {
        SCHOOL,             // 校级
        COLLEGE,            // 院级
        DEPARTMENT          // 部门级
    }

    public enum PlanStatus {
        DRAFT,              // 草稿
        PUBLISHED,          // 已发布
        ARCHIVED            // 已归档
    }
}
