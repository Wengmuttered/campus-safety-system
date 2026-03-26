package com.campussafety.repository;

import com.campussafety.entity.DutySchedule;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface DutyScheduleRepository extends JpaRepository<DutySchedule, Long> {
    List<DutySchedule> findByCampusIdAndDutyDateOrderByStartTimeAsc(Long campusId, LocalDate date);
    List<DutySchedule> findByCampusIdAndDutyDateBetweenOrderByDutyDateAscStartTimeAsc(Long campusId, LocalDate start, LocalDate end);
    List<DutySchedule> findByUserIdAndDutyDateBetween(Long userId, LocalDate start, LocalDate end);
    List<DutySchedule> findByCampusIdAndDutyDateAndStatus(Long campusId, LocalDate date, DutySchedule.DutyStatus status);
}
