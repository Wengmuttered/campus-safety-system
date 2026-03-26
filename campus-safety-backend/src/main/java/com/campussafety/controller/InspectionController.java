package com.campussafety.controller;

import com.campussafety.entity.InspectionRecord;
import com.campussafety.entity.InspectionTask;
import com.campussafety.repository.InspectionRecordRepository;
import com.campussafety.repository.InspectionTaskRepository;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/inspections")
@RequiredArgsConstructor
public class InspectionController {

    private final InspectionTaskRepository taskRepository;
    private final InspectionRecordRepository recordRepository;

    // ========== 巡检任务 ==========

    @GetMapping
    public ApiResponse<Page<InspectionTask>> getTasks(
            @RequestParam Long campusId,
            @RequestParam(required = false) InspectionTask.InspectionStatus status,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        if (status != null) {
            return ApiResponse.success(taskRepository.findByCampusIdAndStatusOrderByCreatedAtDesc(campusId, status, PageRequest.of(page, size)));
        }
        return ApiResponse.success(taskRepository.findByCampusIdOrderByCreatedAtDesc(campusId, PageRequest.of(page, size)));
    }

    @PostMapping
    public ApiResponse<InspectionTask> createTask(@RequestBody InspectionTask task) {
        return ApiResponse.success("巡检任务已创建", taskRepository.save(task));
    }

    @PutMapping("/{id}")
    public ApiResponse<InspectionTask> updateTask(@PathVariable Long id, @RequestBody InspectionTask task) {
        InspectionTask existing = taskRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("巡检任务不存在"));
        if (task.getTitle() != null) existing.setTitle(task.getTitle());
        if (task.getType() != null) existing.setType(task.getType());
        if (task.getAssigneeId() != null) existing.setAssigneeId(task.getAssigneeId());
        if (task.getArea() != null) existing.setArea(task.getArea());
        if (task.getScheduledAt() != null) existing.setScheduledAt(task.getScheduledAt());
        if (task.getRemark() != null) existing.setRemark(task.getRemark());
        return ApiResponse.success("更新成功", taskRepository.save(existing));
    }

    @PutMapping("/{id}/status")
    public ApiResponse<InspectionTask> updateStatus(@PathVariable Long id,
                                                     @RequestParam InspectionTask.InspectionStatus status) {
        InspectionTask task = taskRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("巡检任务不存在"));
        task.setStatus(status);
        if (status == InspectionTask.InspectionStatus.IN_PROGRESS) {
            task.setStartedAt(LocalDateTime.now());
        } else if (status == InspectionTask.InspectionStatus.COMPLETED) {
            task.setCompletedAt(LocalDateTime.now());
        }
        return ApiResponse.success(taskRepository.save(task));
    }

    @PutMapping("/{id}/complete")
    public ApiResponse<InspectionTask> completeTask(@PathVariable Long id,
                                                     @RequestBody Map<String, Object> body) {
        InspectionTask task = taskRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("巡检任务不存在"));
        task.setStatus(InspectionTask.InspectionStatus.COMPLETED);
        task.setCompletedAt(LocalDateTime.now());
        String resultStr = (String) body.get("result");
        if (resultStr != null) task.setResult(InspectionTask.InspectionResult.valueOf(resultStr));
        if (body.get("issueCount") != null) task.setIssueCount((Integer) body.get("issueCount"));
        if (body.get("remark") != null) task.setRemark((String) body.get("remark"));
        return ApiResponse.success("巡检已完成", taskRepository.save(task));
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> deleteTask(@PathVariable Long id) {
        taskRepository.deleteById(id);
        return ApiResponse.success("已删除", null);
    }

    // ========== 巡检统计 ==========

    @GetMapping("/stats")
    public ApiResponse<Map<String, Object>> getStats(@RequestParam Long campusId) {
        return ApiResponse.success(Map.of(
                "total", taskRepository.count(),
                "pending", taskRepository.countByCampusIdAndStatus(campusId, InspectionTask.InspectionStatus.PENDING),
                "inProgress", taskRepository.countByCampusIdAndStatus(campusId, InspectionTask.InspectionStatus.IN_PROGRESS),
                "completed", taskRepository.countByCampusIdAndStatus(campusId, InspectionTask.InspectionStatus.COMPLETED),
                "overdue", taskRepository.countByCampusIdAndStatus(campusId, InspectionTask.InspectionStatus.OVERDUE),
                "abnormal", taskRepository.countByCampusIdAndResult(campusId, InspectionTask.InspectionResult.ABNORMAL)
        ));
    }

    // ========== 巡检记录 ==========

    @GetMapping("/{taskId}/records")
    public ApiResponse<List<InspectionRecord>> getRecords(@PathVariable Long taskId) {
        return ApiResponse.success(recordRepository.findByTaskIdOrderByCreatedAtAsc(taskId));
    }

    @PostMapping("/{taskId}/records")
    public ApiResponse<InspectionRecord> addRecord(@PathVariable Long taskId, @RequestBody InspectionRecord record) {
        record.setTaskId(taskId);
        return ApiResponse.success("记录已添加", recordRepository.save(record));
    }
}
