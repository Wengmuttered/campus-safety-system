package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "alert_records")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AlertRecord {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // 报警用户
    private Long userId;

    // 关联事件（可选）
    private Long eventId;

    // 报警类型
    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private AlertType alertType;

    // 报警位置
    private Double lng;
    private Double lat;

    @Column(length = 200)
    private String locationDesc;

    // 报警内容
    @Column(length = 500)
    private String content;

    // 状态
    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private AlertStatus status;

    // 处理人
    private Long handledBy;

    // 处理备注
    @Column(length = 500)
    private String handleNote;

    private LocalDateTime createdAt;
    private LocalDateTime handledAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        if (status == null) status = AlertStatus.PENDING;
    }

    public enum AlertType {
        SOS,            // 紧急求助
        FIRE_ALARM,     // 火警
        MEDICAL,        // 医疗救助
        SECURITY,       // 安全求助
        OTHER           // 其他
    }

    public enum AlertStatus {
        PENDING,        // 待处理
        DISPATCHED,     // 已派遣
        IN_PROGRESS,    // 处理中
        RESOLVED,       // 已解决
        CANCELLED       // 已取消
    }
}
