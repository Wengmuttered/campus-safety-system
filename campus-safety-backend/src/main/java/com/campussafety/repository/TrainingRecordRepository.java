package com.campussafety.repository;

import com.campussafety.entity.TrainingRecord;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface TrainingRecordRepository extends JpaRepository<TrainingRecord, Long> {
    List<TrainingRecord> findByUserIdOrderByCreatedAtDesc(Long userId);
    List<TrainingRecord> findByCourseId(Long courseId);
    Optional<TrainingRecord> findByCourseIdAndUserId(Long courseId, Long userId);
    long countByCourseIdAndStatus(Long courseId, TrainingRecord.LearningStatus status);
}
