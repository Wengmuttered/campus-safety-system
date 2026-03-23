package com.campussafety.repository;

import com.campussafety.entity.Building;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface BuildingRepository extends JpaRepository<Building, Long> {
    List<Building> findByCampusId(Long campusId);
}
