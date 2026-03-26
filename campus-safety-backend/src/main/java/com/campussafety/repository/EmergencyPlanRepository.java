package com.campussafety.repository;

import com.campussafety.entity.EmergencyPlan;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EmergencyPlanRepository extends JpaRepository<EmergencyPlan, Long> {
    Page<EmergencyPlan> findByCampusIdOrderByCreatedAtDesc(Long campusId, Pageable pageable);
    Page<EmergencyPlan> findByCampusIdAndStatusOrderByCreatedAtDesc(Long campusId, EmergencyPlan.PlanStatus status, Pageable pageable);
    List<EmergencyPlan> findByCampusIdAndTypeAndStatus(Long campusId, EmergencyPlan.PlanType type, EmergencyPlan.PlanStatus status);
}
