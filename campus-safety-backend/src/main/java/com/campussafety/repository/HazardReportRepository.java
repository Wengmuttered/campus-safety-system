package com.campussafety.repository;

import com.campussafety.entity.HazardReport;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HazardReportRepository extends JpaRepository<HazardReport, Long> {
    Page<HazardReport> findByCampusIdOrderByCreatedAtDesc(Long campusId, Pageable pageable);
    Page<HazardReport> findByCampusIdAndStatusOrderByCreatedAtDesc(Long campusId, HazardReport.HazardStatus status, Pageable pageable);
    long countByCampusIdAndStatus(Long campusId, HazardReport.HazardStatus status);
    long countByCampusIdAndLevel(Long campusId, HazardReport.HazardLevel level);
}
