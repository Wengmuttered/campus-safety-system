package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "emergency_events")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EmergencyEvent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 30)
    @Enumerated(EnumType.STRING)
    private EventType type;

    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private SeverityLevel severity;

    @Column(nullable = false, length = 200)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String description;

    // 事件位置
    private Double lng;
    private Double lat;

    @Column(length = 200)
    private String locationDesc;

    // 报告人
    private Long reporterId;

    // 处理人
    private Long handlerId;

    // 事件状态
    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private EventStatus status;

    // 影响范围（米）
    private Double affectedRadius;

    // 伤亡人数
    private Integer casualties;

    private Long campusId;

    private LocalDateTime occurredAt;
    private LocalDateTime resolvedAt;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (status == null) status = EventStatus.REPORTED;
        if (occurredAt == null) occurredAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    public enum EventType {
        FIRE,           // 火灾
        EARTHQUAKE,     // 地震
        FLOOD,          // 洪水
        TYPHOON,        // 台风
        CHEMICAL_LEAK,  // 化学品泄漏
        POWER_OUTAGE,   // 停电
        VIOLENCE,       // 暴力事件
        MEDICAL,        // 医疗急救
        TRAFFIC,        // 交通事故
        OTHER           // 其他
    }

    public enum SeverityLevel {
        LOW,        // 低
        MEDIUM,     // 中
        HIGH,       // 高
        CRITICAL    // 紧急
    }

    public enum EventStatus {
        REPORTED,       // 已上报
        CONFIRMED,      // 已确认
        IN_PROGRESS,    // 处理中
        RESOLVED,       // 已解决
        CLOSED          // 已关闭
    }
}
