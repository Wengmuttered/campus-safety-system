package com.campussafety.repository;

import com.campussafety.entity.SafetyPoint;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface SafetyPointRepository extends JpaRepository<SafetyPoint, Long> {
    List<SafetyPoint> findByCampusId(Long campusId);
    List<SafetyPoint> findByBuildingId(Long buildingId);
    List<SafetyPoint> findByType(SafetyPoint.PointType type);
    List<SafetyPoint> findByCampusIdAndType(Long campusId, SafetyPoint.PointType type);
}
