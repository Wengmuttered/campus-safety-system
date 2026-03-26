package com.campussafety.repository;

import com.campussafety.entity.InspectionRecord;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface InspectionRecordRepository extends JpaRepository<InspectionRecord, Long> {
    List<InspectionRecord> findByTaskIdOrderByCreatedAtAsc(Long taskId);
    long countByTaskIdAndResult(Long taskId, InspectionRecord.CheckResult result);
}
