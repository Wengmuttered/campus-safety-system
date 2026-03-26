package com.campussafety.controller;

import com.campussafety.entity.DutySchedule;
import com.campussafety.repository.DutyScheduleRepository;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/duties")
@RequiredArgsConstructor
public class DutyController {

    private final DutyScheduleRepository dutyRepository;

    @GetMapping
    public ApiResponse<List<DutySchedule>> getDuties(
            @RequestParam Long campusId,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate start,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate end) {
        return ApiResponse.success(dutyRepository.findByCampusIdAndDutyDateBetweenOrderByDutyDateAscStartTimeAsc(campusId, start, end));
    }

    @GetMapping("/today")
    public ApiResponse<List<DutySchedule>> getToday(@RequestParam Long campusId) {
        return ApiResponse.success(dutyRepository.findByCampusIdAndDutyDateOrderByStartTimeAsc(campusId, LocalDate.now()));
    }

    @PostMapping
    public ApiResponse<DutySchedule> create(@RequestBody DutySchedule duty) {
        return ApiResponse.success("排班已创建", dutyRepository.save(duty));
    }

    @PostMapping("/batch")
    public ApiResponse<List<DutySchedule>> batchCreate(@RequestBody List<DutySchedule> duties) {
        return ApiResponse.success("批量排班成功", dutyRepository.saveAll(duties));
    }

    @PutMapping("/{id}")
    public ApiResponse<DutySchedule> update(@PathVariable Long id, @RequestBody DutySchedule duty) {
        DutySchedule existing = dutyRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("排班不存在"));
        if (duty.getUserId() != null) existing.setUserId(duty.getUserId());
        if (duty.getDutyDate() != null) existing.setDutyDate(duty.getDutyDate());
        if (duty.getShiftType() != null) existing.setShiftType(duty.getShiftType());
        if (duty.getArea() != null) existing.setArea(duty.getArea());
        if (duty.getStartTime() != null) existing.setStartTime(duty.getStartTime());
        if (duty.getEndTime() != null) existing.setEndTime(duty.getEndTime());
        if (duty.getRemark() != null) existing.setRemark(duty.getRemark());
        return ApiResponse.success("更新成功", dutyRepository.save(existing));
    }

    @PutMapping("/{id}/status")
    public ApiResponse<DutySchedule> updateStatus(@PathVariable Long id,
                                                    @RequestParam DutySchedule.DutyStatus status) {
        DutySchedule duty = dutyRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("排班不存在"));
        duty.setStatus(status);
        return ApiResponse.success(dutyRepository.save(duty));
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable Long id) {
        dutyRepository.deleteById(id);
        return ApiResponse.success("已删除", null);
    }
}
