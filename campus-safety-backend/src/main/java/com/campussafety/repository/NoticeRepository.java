package com.campussafety.repository;

import com.campussafety.entity.Notice;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NoticeRepository extends JpaRepository<Notice, Long> {
    Page<Notice> findByCampusIdAndStatusOrderByIsTopDescPublishedAtDesc(Long campusId, Notice.NoticeStatus status, Pageable pageable);
    Page<Notice> findByCampusIdOrderByIsTopDescCreatedAtDesc(Long campusId, Pageable pageable);
}
