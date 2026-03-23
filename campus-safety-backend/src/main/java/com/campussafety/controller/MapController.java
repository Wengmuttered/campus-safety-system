package com.campussafety.controller;

import com.campussafety.entity.Building;
import com.campussafety.entity.Campus;
import com.campussafety.service.CampusSafetyService;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/map")
@RequiredArgsConstructor
public class MapController {

    private final CampusSafetyService service;

    @GetMapping("/campuses")
    public ApiResponse<List<Campus>> getCampuses() {
        return ApiResponse.success(service.getAllCampuses());
    }

    @GetMapping("/campus/{id}")
    public ApiResponse<Campus> getCampus(@PathVariable Long id) {
        return ApiResponse.success(service.getCampusById(id));
    }

    @GetMapping("/buildings")
    public ApiResponse<List<Building>> getBuildings(@RequestParam Long campusId) {
        return ApiResponse.success(service.getBuildingsByCampus(campusId));
    }
}
