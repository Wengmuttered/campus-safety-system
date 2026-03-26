package com.campussafety.controller;

import com.campussafety.entity.OperationLog;
import com.campussafety.repository.OperationLogRepository;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/logs")
@RequiredArgsConstructor
public class OperationLogController {

    private final OperationLogRepository logRepository;

    @GetMapping
    public ApiResponse<Page<OperationLog>> getLogs(
            @RequestParam(required = false) String module,
            @RequestParam(required = false) String username,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        if (module != null && !module.isEmpty()) {
            return ApiResponse.success(logRepository.findByModuleOrderByCreatedAtDesc(module, PageRequest.of(page, size)));
        }
        if (username != null && !username.isEmpty()) {
            return ApiResponse.success(logRepository.findByUsernameOrderByCreatedAtDesc(username, PageRequest.of(page, size)));
        }
        return ApiResponse.success(logRepository.findAllByOrderByCreatedAtDesc(PageRequest.of(page, size)));
    }
}
