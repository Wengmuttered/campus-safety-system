package com.campussafety.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * AI 风险分析服务集成
 * 调用 Python FastAPI AI 服务，获取风险预测、热力图和事件分析
 * 当 AI 服务不可用时，自动返回预置演示数据保证系统可用
 */
@Service
@Slf4j
public class AiAnalysisService {

    @Value("${ai.service.url:http://localhost:8089/api/ai}")
    private String aiServiceUrl;

    /**
     * 调用AI服务进行风险预测
     */
    public Map<String, Object> predictRisk(Long campusId) {
        try {
            org.springframework.web.client.RestTemplate restTemplate = new org.springframework.web.client.RestTemplate();
            Map<String, Object> request = Map.of("campus_id", campusId);
            @SuppressWarnings("unchecked")
            Map<String, Object> result = restTemplate.postForObject(
                    aiServiceUrl + "/risk-prediction", request, Map.class);
            return result;
        } catch (Exception e) {
            log.warn("AI服务调用失败，使用预置演示数据: {}", e.getMessage());
            return buildFallbackRiskPrediction();
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
                    aiServiceUrl + "/heatmap", request, Map.class);
            return result;
        } catch (Exception e) {
            log.warn("热力图数据获取失败，使用预置演示数据: {}", e.getMessage());
            return buildFallbackHeatmap();
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
                    aiServiceUrl + "/event-analysis?days=" + d, Map.class);
            return result;
        } catch (Exception e) {
            log.warn("事件分析获取失败，使用预置演示数据: {}", e.getMessage());
            return buildFallbackEventAnalysis(days != null ? days : 90);
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
            restTemplate.postForObject(aiServiceUrl + "/event-ingest", event, Map.class);
            log.info("事件数据已推送至AI服务: {} @ {}", eventType, location);
        } catch (Exception e) {
            log.warn("事件数据推送AI失败（非关键错误）: {}", e.getMessage());
        }
    }

    // ==================== 预置演示兜底数据 ====================

    /**
     * 风险预测兜底：返回基于校园真实建筑的风险评估
     */
    private Map<String, Object> buildFallbackRiskPrediction() {
        List<Map<String, Object>> riskAreas = List.of(
                Map.of("name", "化学实验楼", "lng", 110.3315, "lat", 20.0592,
                        "risk_score", 82.5, "risk_level", "HIGH", "main_risk_type", "CHEMICAL_LEAK",
                        "suggestion", "⚠️ 化学实验楼为高风险区域，建议增加巡逻频次，检查消防设施和化学品存储安全"),
                Map.of("name", "学生宿舍1栋", "lng", 110.3335, "lat", 20.0570,
                        "risk_score", 71.3, "risk_level", "HIGH", "main_risk_type", "FIRE",
                        "suggestion", "⚠️ 学生宿舍1栋为高风险区域，建议加强违规用电检查"),
                Map.of("name", "学生食堂", "lng", 110.3320, "lat", 20.0575,
                        "risk_score", 58.7, "risk_level", "MEDIUM", "main_risk_type", "FIRE",
                        "suggestion", "🔔 学生食堂存在中等风险，建议定期检查排烟与消防系统"),
                Map.of("name", "理工楼", "lng", 110.3310, "lat", 20.0590,
                        "risk_score", 45.2, "risk_level", "MEDIUM", "main_risk_type", "FIRE",
                        "suggestion", "🔔 理工楼存在中等风险，建议定期安全排查"),
                Map.of("name", "体育馆", "lng", 110.3280, "lat", 20.0600,
                        "risk_score", 32.8, "risk_level", "LOW", "main_risk_type", "MEDICAL",
                        "suggestion", "✅ 体育馆风险较低，保持常规安全管理即可"),
                Map.of("name", "图书馆", "lng", 110.3295, "lat", 20.0585,
                        "risk_score", 28.4, "risk_level", "LOW", "main_risk_type", "THEFT",
                        "suggestion", "✅ 图书馆风险较低，保持常规安全管理即可"),
                Map.of("name", "行政楼", "lng", 110.3300, "lat", 20.0595,
                        "risk_score", 18.9, "risk_level", "LOW", "main_risk_type", "OTHER",
                        "suggestion", "✅ 行政楼风险较低，保持常规安全管理即可"),
                Map.of("name", "操场", "lng", 110.3282, "lat", 20.0602,
                        "risk_score", 15.6, "risk_level", "LOW", "main_risk_type", "MEDICAL",
                        "suggestion", "✅ 操场风险较低，保持常规安全管理即可"),
                Map.of("name", "东门", "lng", 110.3340, "lat", 20.0588,
                        "risk_score", 22.1, "risk_level", "LOW", "main_risk_type", "TRAFFIC",
                        "suggestion", "✅ 东门风险较低，注意高峰期交通疏导"),
                Map.of("name", "学生宿舍2栋", "lng", 110.3338, "lat", 20.0565,
                        "risk_score", 65.4, "risk_level", "MEDIUM", "main_risk_type", "FIRE",
                        "suggestion", "🔔 学生宿舍2栋存在中等风险，建议加强安全用电宣传")
        );

        return Map.of(
                "code", 200,
                "message", "预测成功（演示模式）",
                "data", Map.of(
                        "prediction_time", LocalDateTime.now().toString(),
                        "model", "RandomForest（演示模式）",
                        "data_points", 300,
                        "risk_areas", riskAreas,
                        "summary", Map.of(
                                "high_risk_count", 2,
                                "medium_risk_count", 3,
                                "low_risk_count", 5,
                                "avg_risk_score", 44.1
                        )
                )
        );
    }

    /**
     * 热力图兜底：返回基于校园真实坐标的热力点
     */
    private Map<String, Object> buildFallbackHeatmap() {
        List<Map<String, Object>> points = new ArrayList<>();
        // 基于校园实际建筑位置生成热力点
        double[][] hotspots = {
                {110.3315, 20.0592, 4.8},  // 化学实验楼
                {110.3310, 20.0590, 3.2},  // 理工楼
                {110.3335, 20.0570, 3.6},  // 学生宿舍1栋
                {110.3320, 20.0575, 2.8},  // 学生食堂
                {110.3295, 20.0585, 1.5},  // 图书馆
                {110.3280, 20.0600, 1.8},  // 体育馆
                {110.3300, 20.0595, 0.9},  // 行政楼
                {110.3338, 20.0565, 3.0},  // 学生宿舍2栋
        };
        Random rng = new Random(42);
        for (double[] hs : hotspots) {
            // 在每个热点周围生成扩散点
            for (int i = 0; i < 5; i++) {
                double lng = hs[0] + (rng.nextDouble() - 0.5) * 0.001;
                double lat = hs[1] + (rng.nextDouble() - 0.5) * 0.001;
                double intensity = hs[2] * (0.5 + rng.nextDouble() * 0.5);
                points.add(Map.of(
                        "lng", Math.round(lng * 1000000.0) / 1000000.0,
                        "lat", Math.round(lat * 1000000.0) / 1000000.0,
                        "intensity", Math.round(intensity * 100.0) / 100.0,
                        "event_count", (int) Math.ceil(intensity)
                ));
            }
        }
        return Map.of(
                "code", 200,
                "data", Map.of(
                        "grid_size", 20,
                        "total_points", points.size(),
                        "points", points
                )
        );
    }

    /**
     * 事件分析兜底：返回基于模拟数据的分析结果
     */
    private Map<String, Object> buildFallbackEventAnalysis(int days) {
        // 月度趋势
        Map<String, Integer> monthlyTrend = new LinkedHashMap<>();
        YearMonth now = YearMonth.now();
        int months = Math.max(days / 30, 3);
        int[] trendValues = {15, 22, 18, 28, 12, 35, 20, 16, 24, 30, 14, 19};
        for (int i = months - 1; i >= 0; i--) {
            YearMonth m = now.minusMonths(i);
            monthlyTrend.put(m.toString(), trendValues[i % trendValues.length]);
        }
        int totalEvents = monthlyTrend.values().stream().mapToInt(Integer::intValue).sum();

        // 事件类型分布
        Map<String, Integer> typeDistribution = new LinkedHashMap<>();
        typeDistribution.put("FIRE", 28);
        typeDistribution.put("MEDICAL", 22);
        typeDistribution.put("THEFT", 18);
        typeDistribution.put("CHEMICAL_LEAK", 14);
        typeDistribution.put("POWER_OUTAGE", 12);
        typeDistribution.put("TRAFFIC", 9);
        typeDistribution.put("VIOLENCE", 5);
        typeDistribution.put("OTHER", 8);

        // 严重程度分布
        Map<String, Integer> severityDistribution = Map.of(
                "LOW", 42, "MEDIUM", 35, "HIGH", 18, "CRITICAL", 5
        );

        // 高发区域
        Map<String, Integer> hotspots = new LinkedHashMap<>();
        hotspots.put("化学实验楼", 32);
        hotspots.put("学生宿舍1栋", 28);
        hotspots.put("学生食堂", 21);
        hotspots.put("理工楼", 15);
        hotspots.put("体育馆", 12);

        // 时段分布
        Map<String, Integer> hourlyDistribution = new LinkedHashMap<>();
        int[] hourlyValues = {2, 1, 1, 0, 1, 2, 5, 8, 12, 10, 8, 7, 14, 9, 6, 5, 4, 8, 11, 9, 7, 6, 4, 3};
        for (int h = 0; h < 24; h++) {
            hourlyDistribution.put(String.valueOf(h), hourlyValues[h]);
        }

        // AI 洞察建议
        List<Map<String, String>> insights = List.of(
                Map.of("level", "WARNING", "title", "最常见事件类型: FIRE",
                        "description", "占比21.5%，建议针对性加强消防安全防范措施"),
                Map.of("level", "IMPORTANT", "title", "高发区域: 化学实验楼",
                        "description", "该区域事件最为频繁，建议增加安保巡逻频次和监控覆盖"),
                Map.of("level", "NOTE", "title", "严重事件占比23.0%，整体可控",
                        "description", "安全形势相对平稳，继续保持常态化安全管理"),
                Map.of("level", "TIP", "title", "事件高发时段: 12:00",
                        "description", "建议在12:00前后加强安全值守和巡查力度")
        );

        return Map.of(
                "code", 200,
                "data", Map.of(
                        "analysis_period_days", days,
                        "total_events", totalEvents,
                        "type_distribution", typeDistribution,
                        "severity_distribution", severityDistribution,
                        "monthly_trend", monthlyTrend,
                        "hotspots", hotspots,
                        "hourly_distribution", hourlyDistribution,
                        "insights", insights
                )
        );
    }
}
