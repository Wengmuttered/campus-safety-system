package com.campussafety.controller;

import com.campussafety.entity.EmergencyEvent;
import com.campussafety.service.CampusSafetyService;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/events")
@RequiredArgsConstructor
public class EventController {

    private final CampusSafetyService service;

    @GetMapping
    public ApiResponse<Page<EmergencyEvent>> getEvents(
            @RequestParam Long campusId,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        return ApiResponse.success(service.getEvents(campusId, PageRequest.of(page, size)));
    }

    @PostMapping
    public ApiResponse<EmergencyEvent> createEvent(@RequestBody EmergencyEvent event) {
        return ApiResponse.success("事件已上报", service.createEvent(event));
    }

    @PutMapping("/{id}/status")
    public ApiResponse<EmergencyEvent> updateStatus(@PathVariable Long id,
                                                     @RequestParam EmergencyEvent.EventStatus status) {
        return ApiResponse.success(service.updateEventStatus(id, status));
    }
}
