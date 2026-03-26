package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "inspection_records")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class InspectionRecord {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long taskId;

    @Column(nullable = false, length = 100)
    private String checkItem;

    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private CheckResult result;

    @Column(length = 200)
    private String locationDesc;

    @Column(columnDefinition = "TEXT")
    private String photos; // JSON: 图片URL列表

    @Column(length = 500)
    private String remark;

    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }

    public enum CheckResult {
        PASS,       // 合格
        FAIL,       // 不合格
        NA          // 不适用
    }
}
