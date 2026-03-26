package com.campussafety.controller;

import com.campussafety.entity.TrainingCourse;
import com.campussafety.entity.TrainingRecord;
import com.campussafety.repository.TrainingCourseRepository;
import com.campussafety.repository.TrainingRecordRepository;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/training")
@RequiredArgsConstructor
public class TrainingController {

    private final TrainingCourseRepository courseRepository;
    private final TrainingRecordRepository recordRepository;

    // ========== 课程管理 ==========

    @GetMapping("/courses")
    public ApiResponse<Page<TrainingCourse>> getCourses(
            @RequestParam Long campusId,
            @RequestParam(required = false) TrainingCourse.CourseStatus status,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        if (status != null) {
            return ApiResponse.success(courseRepository.findByCampusIdAndStatusOrderByCreatedAtDesc(campusId, status, PageRequest.of(page, size)));
        }
        return ApiResponse.success(courseRepository.findByCampusIdOrderByCreatedAtDesc(campusId, PageRequest.of(page, size)));
    }

    @GetMapping("/courses/{id}")
    public ApiResponse<TrainingCourse> getCourse(@PathVariable Long id) {
        return ApiResponse.success(courseRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("课程不存在")));
    }

    @PostMapping("/courses")
    public ApiResponse<TrainingCourse> createCourse(@RequestBody TrainingCourse course) {
        return ApiResponse.success("课程已创建", courseRepository.save(course));
    }

    @PutMapping("/courses/{id}")
    public ApiResponse<TrainingCourse> updateCourse(@PathVariable Long id, @RequestBody TrainingCourse course) {
        TrainingCourse existing = courseRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("课程不存在"));
        if (course.getTitle() != null) existing.setTitle(course.getTitle());
        if (course.getType() != null) existing.setType(course.getType());
        if (course.getContent() != null) existing.setContent(course.getContent());
        if (course.getVideoUrl() != null) existing.setVideoUrl(course.getVideoUrl());
        if (course.getDuration() != null) existing.setDuration(course.getDuration());
        if (course.getMandatory() != null) existing.setMandatory(course.getMandatory());
        return ApiResponse.success("更新成功", courseRepository.save(existing));
    }

    @PutMapping("/courses/{id}/publish")
    public ApiResponse<TrainingCourse> publishCourse(@PathVariable Long id) {
        TrainingCourse course = courseRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("课程不存在"));
        course.setStatus(TrainingCourse.CourseStatus.PUBLISHED);
        course.setPublishedAt(LocalDateTime.now());
        return ApiResponse.success("课程已发布", courseRepository.save(course));
    }

    @DeleteMapping("/courses/{id}")
    public ApiResponse<Void> deleteCourse(@PathVariable Long id) {
        courseRepository.deleteById(id);
        return ApiResponse.success("已删除", null);
    }

    // ========== 学习记录 ==========

    @GetMapping("/records")
    public ApiResponse<List<TrainingRecord>> getUserRecords(@RequestParam Long userId) {
        return ApiResponse.success(recordRepository.findByUserIdOrderByCreatedAtDesc(userId));
    }

    @PostMapping("/courses/{courseId}/enroll")
    public ApiResponse<TrainingRecord> enroll(@PathVariable Long courseId, @RequestParam Long userId) {
        // 检查是否已报名
        if (recordRepository.findByCourseIdAndUserId(courseId, userId).isPresent()) {
            return ApiResponse.error("已报名该课程");
        }
        TrainingRecord record = TrainingRecord.builder()
                .courseId(courseId)
                .userId(userId)
                .status(TrainingRecord.LearningStatus.NOT_STARTED)
                .progress(0)
                .build();
        return ApiResponse.success("报名成功", recordRepository.save(record));
    }

    @PutMapping("/records/{id}/progress")
    public ApiResponse<TrainingRecord> updateProgress(@PathVariable Long id,
                                                       @RequestBody Map<String, Object> body) {
        TrainingRecord record = recordRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("学习记录不存在"));
        if (body.get("progress") != null) {
            record.setProgress((Integer) body.get("progress"));
        }
        if (record.getStatus() == TrainingRecord.LearningStatus.NOT_STARTED) {
            record.setStatus(TrainingRecord.LearningStatus.IN_PROGRESS);
            record.setStartedAt(LocalDateTime.now());
        }
        if (record.getProgress() >= 100) {
            record.setStatus(TrainingRecord.LearningStatus.COMPLETED);
            record.setCompletedAt(LocalDateTime.now());
        }
        if (body.get("score") != null) {
            record.setScore((Integer) body.get("score"));
        }
        return ApiResponse.success(recordRepository.save(record));
    }

    @GetMapping("/courses/{courseId}/stats")
    public ApiResponse<Map<String, Object>> getCourseStats(@PathVariable Long courseId) {
        List<TrainingRecord> records = recordRepository.findByCourseId(courseId);
        long completed = recordRepository.countByCourseIdAndStatus(courseId, TrainingRecord.LearningStatus.COMPLETED);
        return ApiResponse.success(Map.of(
                "totalEnrolled", records.size(),
                "completed", completed,
                "completionRate", records.isEmpty() ? 0 : Math.round(completed * 100.0 / records.size())
        ));
    }
}
