package com.campussafety.repository;

import com.campussafety.entity.Campus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CampusRepository extends JpaRepository<Campus, Long> {
}
