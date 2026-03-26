package com.campussafety.controller;

import com.campussafety.entity.Notice;
import com.campussafety.repository.NoticeRepository;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

@RestController
@RequestMapping("/api/notices")
@RequiredArgsConstructor
public class NoticeController {

    private final NoticeRepository noticeRepository;

    @GetMapping
    public ApiResponse<Page<Notice>> getNotices(
            @RequestParam Long campusId,
            @RequestParam(required = false) Notice.NoticeStatus status,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        if (status != null) {
            return ApiResponse.success(noticeRepository.findByCampusIdAndStatusOrderByIsTopDescPublishedAtDesc(campusId, status, PageRequest.of(page, size)));
        }
        return ApiResponse.success(noticeRepository.findByCampusIdOrderByIsTopDescCreatedAtDesc(campusId, PageRequest.of(page, size)));
    }

    @PostMapping
    public ApiResponse<Notice> create(@RequestBody Notice notice) {
        return ApiResponse.success("通知已创建", noticeRepository.save(notice));
    }

    @PutMapping("/{id}")
    public ApiResponse<Notice> update(@PathVariable Long id, @RequestBody Notice notice) {
        Notice existing = noticeRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("通知不存在"));
        if (notice.getTitle() != null) existing.setTitle(notice.getTitle());
        if (notice.getContent() != null) existing.setContent(notice.getContent());
        if (notice.getType() != null) existing.setType(notice.getType());
        if (notice.getPriority() != null) existing.setPriority(notice.getPriority());
        if (notice.getIsTop() != null) existing.setIsTop(notice.getIsTop());
        if (notice.getTargetRoles() != null) existing.setTargetRoles(notice.getTargetRoles());
        return ApiResponse.success("更新成功", noticeRepository.save(existing));
    }

    @PutMapping("/{id}/publish")
    public ApiResponse<Notice> publish(@PathVariable Long id) {
        Notice notice = noticeRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("通知不存在"));
        notice.setStatus(Notice.NoticeStatus.PUBLISHED);
        notice.setPublishedAt(LocalDateTime.now());
        return ApiResponse.success("通知已发布", noticeRepository.save(notice));
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable Long id) {
        noticeRepository.deleteById(id);
        return ApiResponse.success("已删除", null);
    }
}
