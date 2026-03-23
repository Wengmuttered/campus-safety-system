package com.campussafety.repository;

import com.campussafety.entity.EvacuationRoute;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface EvacuationRouteRepository extends JpaRepository<EvacuationRoute, Long> {
    List<EvacuationRoute> findByBuildingId(Long buildingId);
    List<EvacuationRoute> findByCampusId(Long campusId);
}
