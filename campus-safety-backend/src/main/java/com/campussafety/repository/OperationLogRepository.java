package com.campussafety.repository;

import com.campussafety.entity.OperationLog;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OperationLogRepository extends JpaRepository<OperationLog, Long> {
    Page<OperationLog> findByModuleOrderByCreatedAtDesc(String module, Pageable pageable);
    Page<OperationLog> findByUsernameOrderByCreatedAtDesc(String username, Pageable pageable);
    Page<OperationLog> findAllByOrderByCreatedAtDesc(Pageable pageable);
}
