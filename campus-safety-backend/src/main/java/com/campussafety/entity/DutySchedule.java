package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.LocalDateTime;

@Entity
@Table(name = "duty_schedules")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DutySchedule {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long userId;

    private Long campusId;

    @Column(nullable = false)
    private LocalDate dutyDate;

    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private ShiftType shiftType;

    @Column(length = 100)
    private String area; // 值班区域

    private LocalTime startTime;
    private LocalTime endTime;

    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private DutyStatus status;

    @Column(length = 500)
    private String remark;

    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        if (status == null) status = DutyStatus.SCHEDULED;
    }

    public enum ShiftType {
        DAY,            // 白班 (08:00-18:00)
        NIGHT,          // 夜班 (18:00-08:00)
        FULL            // 全天 (08:00-08:00)
    }

    public enum DutyStatus {
        SCHEDULED,      // 已排班
        ON_DUTY,        // 值班中
        OFF_DUTY,       // 已下班
        ABSENT          // 缺勤
    }
}
