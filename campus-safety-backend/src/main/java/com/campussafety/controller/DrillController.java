package com.campussafety.controller;

import com.campussafety.entity.DrillPlan;
import com.campussafety.service.CampusSafetyService;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/drills")
@RequiredArgsConstructor
public class DrillController {

    private final CampusSafetyService service;

    @GetMapping
    public ApiResponse<List<DrillPlan>> getDrills(@RequestParam Long campusId) {
        return ApiResponse.success(service.getDrillsByCampus(campusId));
    }

    @PostMapping
    public ApiResponse<DrillPlan> create(@RequestBody DrillPlan plan) {
        return ApiResponse.success("演练计划已创建", service.createDrill(plan));
    }

    @PutMapping("/{id}/status")
    public ApiResponse<DrillPlan> updateStatus(@PathVariable Long id,
                                                @RequestParam DrillPlan.DrillStatus status) {
        return ApiResponse.success(service.updateDrillStatus(id, status));
    }
}
