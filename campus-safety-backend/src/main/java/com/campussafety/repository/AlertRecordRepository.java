package com.campussafety.repository;

import com.campussafety.entity.AlertRecord;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface AlertRecordRepository extends JpaRepository<AlertRecord, Long> {
    Page<AlertRecord> findByStatusOrderByCreatedAtDesc(AlertRecord.AlertStatus status, Pageable pageable);
    List<AlertRecord> findByUserIdOrderByCreatedAtDesc(Long userId);
    long countByStatus(AlertRecord.AlertStatus status);
}
