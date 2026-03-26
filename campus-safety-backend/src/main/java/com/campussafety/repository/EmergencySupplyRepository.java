package com.campussafety.repository;

import com.campussafety.entity.EmergencySupply;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface EmergencySupplyRepository extends JpaRepository<EmergencySupply, Long> {
    Page<EmergencySupply> findByCampusIdOrderByCreatedAtDesc(Long campusId, Pageable pageable);
    Page<EmergencySupply> findByCampusIdAndCategoryOrderByCreatedAtDesc(Long campusId, EmergencySupply.SupplyCategory category, Pageable pageable);
    List<EmergencySupply> findByCampusIdAndStatus(Long campusId, EmergencySupply.SupplyStatus status);
    List<EmergencySupply> findByExpiryDateBefore(LocalDate date);
}
