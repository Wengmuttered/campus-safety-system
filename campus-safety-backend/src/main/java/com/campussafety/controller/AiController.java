package com.campussafety.controller;

import com.campussafety.service.AiAnalysisService;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * AI 风险分析 API
 * 后端代理 Python AI 服务的接口
 */
@RestController
@RequestMapping("/api/ai")
@RequiredArgsConstructor
public class AiController {

    private final AiAnalysisService aiService;

    @PostMapping("/risk-prediction")
    public ApiResponse<Map<String, Object>> predictRisk(
            @RequestParam(defaultValue = "1") Long campusId) {
        Map<String, Object> result = aiService.predictRisk(campusId);
        return ApiResponse.success(result);
    }

    @PostMapping("/heatmap")
    public ApiResponse<Map<String, Object>> getHeatmap(
            @RequestParam(required = false) Double centerLng,
            @RequestParam(required = false) Double centerLat,
            @RequestParam(required = false) Integer gridSize) {
        Map<String, Object> result = aiService.getHeatmap(centerLng, centerLat, gridSize);
        return ApiResponse.success(result);
    }

    @GetMapping("/event-analysis")
    public ApiResponse<Map<String, Object>> analyzeEvents(
            @RequestParam(defaultValue = "90") Integer days) {
        Map<String, Object> result = aiService.analyzeEvents(days);
        return ApiResponse.success(result);
    }

    @GetMapping("/health")
    public ApiResponse<Map<String, Object>> health() {
        try {
            org.springframework.web.client.RestTemplate restTemplate = new org.springframework.web.client.RestTemplate();
            @SuppressWarnings("unchecked")
            Map<String, Object> result = restTemplate.getForObject(
                    "http://localhost:8089/api/ai/health", Map.class);
            return ApiResponse.success(result);
        } catch (Exception e) {
            return ApiResponse.success(Map.of("status", "offline", "message", "AI服务不可用"));
        }
    }
}
