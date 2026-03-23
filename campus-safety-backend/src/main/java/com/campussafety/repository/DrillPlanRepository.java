package com.campussafety.repository;

import com.campussafety.entity.DrillPlan;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface DrillPlanRepository extends JpaRepository<DrillPlan, Long> {
    List<DrillPlan> findByCampusIdOrderByScheduledAtDesc(Long campusId);
    List<DrillPlan> findByStatus(DrillPlan.DrillStatus status);
}
