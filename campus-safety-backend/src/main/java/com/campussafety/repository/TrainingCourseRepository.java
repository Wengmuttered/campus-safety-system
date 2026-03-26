package com.campussafety.repository;

import com.campussafety.entity.TrainingCourse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TrainingCourseRepository extends JpaRepository<TrainingCourse, Long> {
    Page<TrainingCourse> findByCampusIdAndStatusOrderByCreatedAtDesc(Long campusId, TrainingCourse.CourseStatus status, Pageable pageable);
    Page<TrainingCourse> findByCampusIdOrderByCreatedAtDesc(Long campusId, Pageable pageable);
}
