package com.campussafety.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * AI 风险分析服务集成
 * 调用 Python FastAPI AI 服务，获取风险预测、热力图和事件分析
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class AiAnalysisService {

    private static final String AI_SERVICE_URL = "http://localhost:8089/api/ai";

    /**
     * 调用AI服务进行风险预测
     */
    public Map<String, Object> predictRisk(Long campusId) {
        try {
            // 使用RestTemplate（简单方式）调用AI服务
            org.springframework.web.client.RestTemplate restTemplate = new org.springframework.web.client.RestTemplate();
            Map<String, Object> request = Map.of("campus_id", campusId);
            @SuppressWarnings("unchecked")
            Map<String, Object> result = restTemplate.postForObject(
                    AI_SERVICE_URL + "/risk-prediction", request, Map.class);
            return result;
        } catch (Exception e) {
            log.warn("AI服务调用失败: {}", e.getMessage());
            return Map.of("code", 503, "message", "AI服务暂不可用");
        }
    }

    /**
     * 获取热力图数据
     */
    public Map<String, Object> getHeatmap(Double centerLng, Double centerLat, Integer gridSize) {
        try {
            org.springframework.web.client.RestTemplate restTemplate = new org.springframework.web.client.RestTemplate();
            Map<String, Object> request = Map.of(
                    "campus_id", 1,
                    "center_lng", centerLng != null ? centerLng : 110.3308,
                    "center_lat", centerLat != null ? centerLat : 20.0588,
                    "grid_size", gridSize != null ? gridSize : 20
            );
            @SuppressWarnings("unchecked")
            Map<String, Object> result = restTemplate.postForObject(
                    AI_SERVICE_URL + "/heatmap", request, Map.class);
            return result;
        } catch (Exception e) {
            log.warn("热力图数据获取失败: {}", e.getMessage());
            return Map.of("code", 503, "message", "AI服务暂不可用");
        }
    }

    /**
     * 获取事件分析
     */
    public Map<String, Object> analyzeEvents(Integer days) {
        try {
            org.springframework.web.client.RestTemplate restTemplate = new org.springframework.web.client.RestTemplate();
            int d = days != null ? days : 90;
            @SuppressWarnings("unchecked")
            Map<String, Object> result = restTemplate.getForObject(
                    AI_SERVICE_URL + "/event-analysis?days=" + d, Map.class);
            return result;
        } catch (Exception e) {
            log.warn("事件分析获取失败: {}", e.getMessage());
            return Map.of("code", 503, "message", "AI服务暂不可用");
        }
    }

    /**
     * 向AI服务推送新事件数据，用于更新模型
     */
    public void ingestEvent(String eventType, String severity, String location,
                            Double lng, Double lat, String occurredAt) {
        try {
            org.springframework.web.client.RestTemplate restTemplate = new org.springframework.web.client.RestTemplate();
            Map<String, Object> event = Map.of(
                    "event_type", eventType,
                    "severity", severity,
                    "location", location,
                    "lng", lng,
                    "lat", lat,
                    "occurred_at", occurredAt
            );
            restTemplate.postForObject(AI_SERVICE_URL + "/event-ingest", event, Map.class);
            log.info("事件数据已推送至AI服务: {} @ {}", eventType, location);
        } catch (Exception e) {
            log.warn("事件数据推送AI失败: {}", e.getMessage());
        }
    }
}
