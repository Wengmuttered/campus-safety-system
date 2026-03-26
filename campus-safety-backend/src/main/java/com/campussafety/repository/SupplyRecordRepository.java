package com.campussafety.repository;

import com.campussafety.entity.SupplyRecord;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SupplyRecordRepository extends JpaRepository<SupplyRecord, Long> {
    List<SupplyRecord> findBySupplyIdOrderByCreatedAtDesc(Long supplyId);
}
