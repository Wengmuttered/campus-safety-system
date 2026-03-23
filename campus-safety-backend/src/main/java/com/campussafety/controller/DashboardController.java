package com.campussafety.controller;

import com.campussafety.dto.DashboardStats;
import com.campussafety.service.CampusSafetyService;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/dashboard")
@RequiredArgsConstructor
public class DashboardController {

    private final CampusSafetyService service;

    @GetMapping("/stats")
    public ApiResponse<DashboardStats> getStats(@RequestParam(defaultValue = "1") Long campusId) {
        return ApiResponse.success(service.getDashboardStats(campusId));
    }
}
