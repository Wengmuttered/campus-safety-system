package com.campussafety.controller;

import com.campussafety.dto.SosRequest;
import com.campussafety.entity.AlertRecord;
import com.campussafety.service.CampusSafetyService;
import com.campussafety.util.ApiResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/alerts")
@RequiredArgsConstructor
public class AlertController {

    private final CampusSafetyService service;

    @PostMapping("/sos")
    public ApiResponse<AlertRecord> sendSos(@Valid @RequestBody SosRequest request,
                                             Authentication auth) {
        String username = (auth != null) ? auth.getName() : "anonymous";
        AlertRecord alert = service.createSosAlert(request, username);
        return ApiResponse.success("求助信息已发送", alert);
    }

    @GetMapping
    public ApiResponse<Page<AlertRecord>> getAlerts(
            @RequestParam(defaultValue = "PENDING") AlertRecord.AlertStatus status,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        return ApiResponse.success(service.getAlertsByStatus(status, PageRequest.of(page, size)));
    }

    @PutMapping("/{id}/handle")
    public ApiResponse<AlertRecord> handleAlert(@PathVariable Long id,
                                                 @RequestParam Long handlerId,
                                                 @RequestParam(required = false) String note) {
        return ApiResponse.success(service.handleAlert(id, handlerId, note));
    }
}
