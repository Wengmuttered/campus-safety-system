package com.campussafety.controller;

import com.campussafety.entity.EvacuationRoute;
import com.campussafety.service.CampusSafetyService;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/evacuation")
@RequiredArgsConstructor
public class EvacuationController {

    private final CampusSafetyService service;

    @GetMapping("/routes")
    public ApiResponse<List<EvacuationRoute>> getRoutes(@RequestParam Long buildingId) {
        return ApiResponse.success(service.getRoutesByBuilding(buildingId));
    }
}
