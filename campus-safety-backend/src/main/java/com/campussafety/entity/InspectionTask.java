package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "inspection_tasks")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class InspectionTask {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String title;

    @Column(nullable = false, length = 30)
    @Enumerated(EnumType.STRING)
    private InspectionType type;

    private Long assigneeId;
    private Long campusId;
    private Long createdBy;

    @Column(columnDefinition = "TEXT")
    private String route; // 巡检路线JSON

    @Column(length = 200)
    private String area; // 巡检区域

    private LocalDateTime scheduledAt;
    private LocalDateTime startedAt;
    private LocalDateTime completedAt;

    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private InspectionStatus status;

    @Column(length = 20)
    @Enumerated(EnumType.STRING)
    private InspectionResult result;

    // 巡检发现问题数
    private Integer issueCount;

    @Column(columnDefinition = "TEXT")
    private String remark;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (status == null) status = InspectionStatus.PENDING;
        if (issueCount == null) issueCount = 0;
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    public enum InspectionType {
        FIRE,           // 消防巡检
        LABORATORY,     // 实验室安全
        FOOD,           // 食品安全
        DORMITORY,      // 宿舍安全
        ELECTRICAL,     // 电气安全
        BUILDING,       // 建筑安全
        COMPREHENSIVE   // 综合巡检
    }

    public enum InspectionStatus {
        PENDING,        // 待执行
        IN_PROGRESS,    // 巡检中
        COMPLETED,      // 已完成
        OVERDUE         // 已逾期
    }

    public enum InspectionResult {
        NORMAL,         // 正常
        ABNORMAL        // 发现异常
    }
}
