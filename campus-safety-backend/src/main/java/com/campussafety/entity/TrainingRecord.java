package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "training_records")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TrainingRecord {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long courseId;

    @Column(nullable = false)
    private Long userId;

    private Integer progress; // 学习进度百分比 0-100

    private Integer score; // 考试分数

    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private LearningStatus status;

    private LocalDateTime startedAt;
    private LocalDateTime completedAt;
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        if (status == null) status = LearningStatus.NOT_STARTED;
        if (progress == null) progress = 0;
    }

    public enum LearningStatus {
        NOT_STARTED,    // 未开始
        IN_PROGRESS,    // 学习中
        COMPLETED,      // 已完成
        FAILED          // 未通过
    }
}
