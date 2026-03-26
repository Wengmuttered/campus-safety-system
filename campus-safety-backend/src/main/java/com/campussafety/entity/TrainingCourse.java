package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "training_courses")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TrainingCourse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 200)
    private String title;

    @Column(nullable = false, length = 30)
    @Enumerated(EnumType.STRING)
    private CourseType type;

    @Column(columnDefinition = "TEXT")
    private String content;

    @Column(length = 500)
    private String videoUrl;

    @Column(length = 500)
    private String coverImage;

    private Integer duration; // 课程时长（分钟）

    private Boolean mandatory; // 是否必修

    @Column(columnDefinition = "TEXT")
    private String targetRoles; // JSON: 目标角色

    private Long campusId;
    private Long createdBy;

    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private CourseStatus status;

    private LocalDateTime publishedAt;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (status == null) status = CourseStatus.DRAFT;
        if (mandatory == null) mandatory = false;
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    public enum CourseType {
        FIRE,               // 消防安全
        FIRST_AID,          // 急救培训
        DISASTER,           // 防灾减灾
        LAB_SAFETY,         // 实验室安全
        FOOD_SAFETY,        // 食品安全
        TRAFFIC,            // 交通安全
        REGULATION          // 安全规范
    }

    public enum CourseStatus {
        DRAFT,              // 草稿
        PUBLISHED,          // 已发布
        ARCHIVED            // 已归档
    }
}
