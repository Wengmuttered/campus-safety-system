package com.campussafety.controller;

import com.campussafety.dto.MapLayerDefinitionDto;
import com.campussafety.dto.MapLayerUpdateRequest;
import com.campussafety.service.MapLayerDefinitionService;
import com.campussafety.util.ApiResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/map/layers")
@RequiredArgsConstructor
public class MapLayerController {

    private final MapLayerDefinitionService service;

    @GetMapping
    public ApiResponse<List<MapLayerDefinitionDto>> list() {
        return ApiResponse.success(service.listForViewer());
    }

    @PatchMapping("/{id}")
    public ApiResponse<MapLayerDefinitionDto> patch(@PathVariable Long id, @Valid @RequestBody MapLayerUpdateRequest req) {
        return service.patch(id, req)
                .map(ApiResponse::success)
                .orElseGet(() -> ApiResponse.error(404, "图层不存在"));
    }
}
