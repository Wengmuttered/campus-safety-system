package com.campussafety.controller;

import com.campussafety.entity.HazardReport;
import com.campussafety.repository.HazardReportRepository;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Map;

@RestController
@RequestMapping("/api/hazards")
@RequiredArgsConstructor
public class HazardController {

    private final HazardReportRepository hazardRepository;

    @GetMapping
    public ApiResponse<Page<HazardReport>> getHazards(
            @RequestParam Long campusId,
            @RequestParam(required = false) HazardReport.HazardStatus status,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        if (status != null) {
            return ApiResponse.success(hazardRepository.findByCampusIdAndStatusOrderByCreatedAtDesc(campusId, status, PageRequest.of(page, size)));
        }
        return ApiResponse.success(hazardRepository.findByCampusIdOrderByCreatedAtDesc(campusId, PageRequest.of(page, size)));
    }

    @PostMapping
    public ApiResponse<HazardReport> create(@RequestBody HazardReport report) {
        return ApiResponse.success("隐患已上报", hazardRepository.save(report));
    }

    @PutMapping("/{id}")
    public ApiResponse<HazardReport> update(@PathVariable Long id, @RequestBody HazardReport report) {
        HazardReport existing = hazardRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("隐患记录不存在"));
        if (report.getTitle() != null) existing.setTitle(report.getTitle());
        if (report.getType() != null) existing.setType(report.getType());
        if (report.getLevel() != null) existing.setLevel(report.getLevel());
        if (report.getDescription() != null) existing.setDescription(report.getDescription());
        if (report.getAssigneeId() != null) existing.setAssigneeId(report.getAssigneeId());
        if (report.getDeadline() != null) existing.setDeadline(report.getDeadline());
        if (report.getRectificationPlan() != null) existing.setRectificationPlan(report.getRectificationPlan());
        return ApiResponse.success("更新成功", hazardRepository.save(existing));
    }

    @PutMapping("/{id}/status")
    public ApiResponse<HazardReport> updateStatus(@PathVariable Long id,
                                                    @RequestParam HazardReport.HazardStatus status) {
        HazardReport report = hazardRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("隐患记录不存在"));
        report.setStatus(status);
        if (status == HazardReport.HazardStatus.VERIFIED) {
            report.setVerifiedAt(LocalDateTime.now());
        }
        return ApiResponse.success(hazardRepository.save(report));
    }

    @PutMapping("/{id}/rectify")
    public ApiResponse<HazardReport> submitRectification(@PathVariable Long id,
                                                          @RequestBody Map<String, String> body) {
        HazardReport report = hazardRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("隐患记录不存在"));
        report.setRectificationResult(body.get("result"));
        report.setStatus(HazardReport.HazardStatus.RECTIFIED);
        if (body.get("images") != null) report.setImages(body.get("images"));
        return ApiResponse.success("整改结果已提交", hazardRepository.save(report));
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable Long id) {
        hazardRepository.deleteById(id);
        return ApiResponse.success("已删除", null);
    }

    @GetMapping("/stats")
    public ApiResponse<Map<String, Object>> getStats(@RequestParam Long campusId) {
        return ApiResponse.success(Map.of(
                "total", hazardRepository.count(),
                "reported", hazardRepository.countByCampusIdAndStatus(campusId, HazardReport.HazardStatus.REPORTED),
                "rectifying", hazardRepository.countByCampusIdAndStatus(campusId, HazardReport.HazardStatus.RECTIFYING),
                "closed", hazardRepository.countByCampusIdAndStatus(campusId, HazardReport.HazardStatus.CLOSED),
                "minor", hazardRepository.countByCampusIdAndLevel(campusId, HazardReport.HazardLevel.MINOR),
                "major", hazardRepository.countByCampusIdAndLevel(campusId, HazardReport.HazardLevel.MAJOR),
                "critical", hazardRepository.countByCampusIdAndLevel(campusId, HazardReport.HazardLevel.CRITICAL)
        ));
    }
}
