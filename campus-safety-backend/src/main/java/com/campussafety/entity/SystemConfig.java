package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

/**
 * 系统配置项
 */
@Entity
@Table(name = "system_configs")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SystemConfig {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 100)
    private String configKey;

    @Column(columnDefinition = "TEXT")
    private String configValue;

    @Column(length = 50)
    private String category;    // SYSTEM, SAFETY, NOTIFICATION, UPLOAD

    @Column(length = 200)
    private String description;

    private LocalDateTime updatedAt;

    @PrePersist
    @PreUpdate
    protected void onSave() { updatedAt = LocalDateTime.now(); }
}
