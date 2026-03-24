package com.campussafety.controller;

import com.campussafety.entity.SafetyPoint;
import com.campussafety.service.CampusSafetyService;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/safety-points")
@RequiredArgsConstructor
public class SafetyPointController {

    private final CampusSafetyService service;

    @GetMapping
    public ApiResponse<List<SafetyPoint>> getPoints(@RequestParam Long campusId) {
        return ApiResponse.success(service.getSafetyPointsByCampus(campusId));
    }

    @PostMapping
    public ApiResponse<SafetyPoint> create(@RequestBody SafetyPoint point) {
        return ApiResponse.success("创建成功", service.createSafetyPoint(point));
    }

    @PutMapping("/{id}")
    public ApiResponse<SafetyPoint> update(@PathVariable Long id, @RequestBody SafetyPoint point) {
        return ApiResponse.success("更新成功", service.updateSafetyPoint(id, point));
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable Long id) {
        service.deleteSafetyPoint(id);
        return ApiResponse.success("删除成功", null);
    }

    @PutMapping("/{id}/status")
    public ApiResponse<SafetyPoint> updateStatus(@PathVariable Long id,
                                                  @RequestParam SafetyPoint.PointStatus status) {
        SafetyPoint point = service.getSafetyPointsByCampus(1L).stream()
                .filter(p -> p.getId().equals(id)).findFirst()
                .orElseThrow(() -> new RuntimeException("点位不存在"));
        point.setStatus(status);
        return ApiResponse.success("状态已更新", service.updateSafetyPoint(id, point));
    }
}
