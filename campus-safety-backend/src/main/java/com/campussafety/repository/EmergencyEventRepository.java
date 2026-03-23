package com.campussafety.repository;

import com.campussafety.entity.EmergencyEvent;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.time.LocalDateTime;
import java.util.List;

public interface EmergencyEventRepository extends JpaRepository<EmergencyEvent, Long> {
    Page<EmergencyEvent> findByCampusIdOrderByCreatedAtDesc(Long campusId, Pageable pageable);
    List<EmergencyEvent> findByStatusIn(List<EmergencyEvent.EventStatus> statuses);
    
    @Query("SELECT e FROM EmergencyEvent e WHERE e.campusId = :campusId AND e.occurredAt BETWEEN :start AND :end")
    List<EmergencyEvent> findByCampusIdAndTimeRange(Long campusId, LocalDateTime start, LocalDateTime end);
    
    long countByCampusIdAndStatus(Long campusId, EmergencyEvent.EventStatus status);
}
