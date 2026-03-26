package com.campussafety.repository;

import com.campussafety.entity.InspectionTask;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface InspectionTaskRepository extends JpaRepository<InspectionTask, Long> {
    Page<InspectionTask> findByCampusIdOrderByCreatedAtDesc(Long campusId, Pageable pageable);
    Page<InspectionTask> findByCampusIdAndStatusOrderByCreatedAtDesc(Long campusId, InspectionTask.InspectionStatus status, Pageable pageable);
    List<InspectionTask> findByAssigneeIdAndStatus(Long assigneeId, InspectionTask.InspectionStatus status);
    long countByCampusIdAndStatus(Long campusId, InspectionTask.InspectionStatus status);
    long countByCampusIdAndResult(Long campusId, InspectionTask.InspectionResult result);
}
