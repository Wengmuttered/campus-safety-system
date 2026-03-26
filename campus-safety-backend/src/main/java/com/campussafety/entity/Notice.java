package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "notices")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Notice {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 200)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String content;

    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private NoticeType type;

    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private NoticePriority priority;

    private Long publisherId;
    private Long campusId;

    @Column(columnDefinition = "TEXT")
    private String targetRoles; // JSON: 目标角色列表

    @Column(length = 500)
    private String attachment;

    private Boolean isTop; // 是否置顶

    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private NoticeStatus status;

    private LocalDateTime publishedAt;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (status == null) status = NoticeStatus.DRAFT;
        if (isTop == null) isTop = false;
        if (priority == null) priority = NoticePriority.NORMAL;
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    public enum NoticeType {
        NOTICE,         // 通知
        ANNOUNCEMENT,   // 公告
        ALERT,          // 预警
        TRAINING        // 培训通知
    }

    public enum NoticePriority {
        NORMAL,         // 普通
        IMPORTANT,      // 重要
        URGENT          // 紧急
    }

    public enum NoticeStatus {
        DRAFT,          // 草稿
        PUBLISHED,      // 已发布
        ARCHIVED        // 已归档
    }
}
