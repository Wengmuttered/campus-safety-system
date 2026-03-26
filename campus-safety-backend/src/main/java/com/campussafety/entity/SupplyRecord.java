package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "supply_records")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SupplyRecord {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long supplyId;

    @Column(nullable = false, length = 10)
    @Enumerated(EnumType.STRING)
    private RecordType type;

    @Column(nullable = false)
    private Integer quantity;

    private Long operatorId;

    @Column(length = 200)
    private String reason;

    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }

    public enum RecordType {
        IN,         // 入库
        OUT,        // 出库
        CHECK       // 盘点
    }
}
