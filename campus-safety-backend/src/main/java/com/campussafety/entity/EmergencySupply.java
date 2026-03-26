package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "emergency_supplies")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EmergencySupply {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String name;

    @Column(nullable = false, length = 30)
    @Enumerated(EnumType.STRING)
    private SupplyCategory category;

    @Column(length = 100)
    private String model;

    @Column(nullable = false)
    private Integer quantity;

    @Column(length = 20)
    private String unit;

    @Column(length = 200)
    private String warehouseLocation;

    private Long buildingId;
    private Long campusId;

    private LocalDate expiryDate;

    @Column(nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private SupplyStatus status;

    @Column(length = 50)
    private String manager;

    private LocalDate lastCheckDate;
    private Integer minStock; // 最低库存预警值

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (status == null) status = SupplyStatus.NORMAL;
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    public enum SupplyCategory {
        FIRE_EQUIPMENT,     // 消防器材
        MEDICAL,            // 急救设备
        PROTECTION,         // 防护用品
        COMMUNICATION,      // 通讯设备
        LIGHTING,           // 照明设备
        RESCUE,             // 救援工具
        OTHER               // 其他
    }

    public enum SupplyStatus {
        NORMAL,             // 正常
        LOW_STOCK,          // 库存不足
        EXPIRED,            // 已过期
        DAMAGED             // 已损坏
    }
}
