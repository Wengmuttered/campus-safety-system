package com.campussafety.controller;

import com.campussafety.entity.EmergencyPlan;
import com.campussafety.repository.EmergencyPlanRepository;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

@RestController
@RequestMapping("/api/plans")
@RequiredArgsConstructor
public class EmergencyPlanController {

    private final EmergencyPlanRepository planRepository;

    @GetMapping
    public ApiResponse<Page<EmergencyPlan>> getPlans(
            @RequestParam Long campusId,
            @RequestParam(required = false) EmergencyPlan.PlanStatus status,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        if (status != null) {
            return ApiResponse.success(planRepository.findByCampusIdAndStatusOrderByCreatedAtDesc(campusId, status, PageRequest.of(page, size)));
        }
        return ApiResponse.success(planRepository.findByCampusIdOrderByCreatedAtDesc(campusId, PageRequest.of(page, size)));
    }

    @GetMapping("/{id}")
    public ApiResponse<EmergencyPlan> getPlan(@PathVariable Long id) {
        return ApiResponse.success(planRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("预案不存在")));
    }

    @PostMapping
    public ApiResponse<EmergencyPlan> create(@RequestBody EmergencyPlan plan) {
        return ApiResponse.success("预案已创建", planRepository.save(plan));
    }

    @PutMapping("/{id}")
    public ApiResponse<EmergencyPlan> update(@PathVariable Long id, @RequestBody EmergencyPlan plan) {
        EmergencyPlan existing = planRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("预案不存在"));
        if (plan.getTitle() != null) existing.setTitle(plan.getTitle());
        if (plan.getType() != null) existing.setType(plan.getType());
        if (plan.getLevel() != null) existing.setLevel(plan.getLevel());
        if (plan.getContent() != null) existing.setContent(plan.getContent());
        if (plan.getProcedures() != null) existing.setProcedures(plan.getProcedures());
        if (plan.getDepartments() != null) existing.setDepartments(plan.getDepartments());
        if (plan.getResources() != null) existing.setResources(plan.getResources());
        if (plan.getAttachmentUrl() != null) existing.setAttachmentUrl(plan.getAttachmentUrl());
        return ApiResponse.success("更新成功", planRepository.save(existing));
    }

    @PutMapping("/{id}/publish")
    public ApiResponse<EmergencyPlan> publish(@PathVariable Long id) {
        EmergencyPlan plan = planRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("预案不存在"));
        plan.setStatus(EmergencyPlan.PlanStatus.PUBLISHED);
        plan.setPublishedAt(LocalDateTime.now());
        return ApiResponse.success("预案已发布", planRepository.save(plan));
    }

    @PutMapping("/{id}/archive")
    public ApiResponse<EmergencyPlan> archive(@PathVariable Long id) {
        EmergencyPlan plan = planRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("预案不存在"));
        plan.setStatus(EmergencyPlan.PlanStatus.ARCHIVED);
        return ApiResponse.success("预案已归档", planRepository.save(plan));
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable Long id) {
        planRepository.deleteById(id);
        return ApiResponse.success("已删除", null);
    }
}
