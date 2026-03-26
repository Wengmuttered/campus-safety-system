package com.campussafety.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "operation_logs")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OperationLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long userId;

    @Column(length = 50)
    private String username;

    @Column(length = 50)
    private String module;

    @Column(length = 50)
    private String action;

    @Column(length = 200)
    private String target;

    @Column(columnDefinition = "TEXT")
    private String detail;

    @Column(length = 50)
    private String ip;

    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}
