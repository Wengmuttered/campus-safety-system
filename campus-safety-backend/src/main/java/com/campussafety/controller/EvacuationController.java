package com.campussafety.controller;

import com.campussafety.entity.EvacuationRoute;
import com.campussafety.service.CampusSafetyService;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/evacuation")
@RequiredArgsConstructor
public class EvacuationController {

    private final CampusSafetyService service;

    @GetMapping("/routes")
    public ApiResponse<List<EvacuationRoute>> getRoutes(@RequestParam Long buildingId) {
        return ApiResponse.success(service.getRoutesByBuilding(buildingId));
    }

    /**
     * 智能疏散路线推荐：根据当前楼层人数密度和路线拥堵度，推荐最优路线
     */
    @GetMapping("/recommend")
    public ApiResponse<Map<String, Object>> recommendRoute(
            @RequestParam Long buildingId,
            @RequestParam(defaultValue = "1") Integer currentFloor,
            @RequestParam(defaultValue = "100") Integer personCount) {

        List<EvacuationRoute> routes = service.getRoutesByBuilding(buildingId);
        if (routes.isEmpty()) {
            return ApiResponse.success(Map.of("recommendation", "暂无可用疏散路线", "routes", List.of()));
        }

        // 为每条路线计算综合评分（模拟 AI 算法）
        Random rand = new Random(buildingId + currentFloor);
        List<Map<String, Object>> scoredRoutes = routes.stream().map(route -> {
            Map<String, Object> scored = new LinkedHashMap<>();
            scored.put("routeId", route.getId());
            scored.put("routeName", route.getName());
            scored.put("distance", route.getDistance());
            scored.put("estimatedTime", route.getEstimatedTime());
            scored.put("capacity", route.getCapacity());
            scored.put("accessible", route.getAccessible());

            // 模拟实时拥堵率 (0.1~0.9)
            double congestion = 0.1 + rand.nextDouble() * 0.8;
            scored.put("congestionRate", Math.round(congestion * 100) / 100.0);

            // 综合评分：(容量余量 × 0.4) + (速度 × 0.3) + (距离短 × 0.3) - 拥堵惩罚
            double capacityScore = Math.min(1.0, (double) route.getCapacity() / Math.max(personCount, 1));
            double speedScore = 1.0 - Math.min(1.0, route.getEstimatedTime() / 200.0);
            double distanceScore = 1.0 - Math.min(1.0, route.getDistance() / 200.0);
            double totalScore = (capacityScore * 0.4 + speedScore * 0.3 + distanceScore * 0.3) * (1.0 - congestion * 0.5);
            scored.put("aiScore", Math.round(totalScore * 100) / 100.0);

            // 预估实际用时（考虑拥堵后）
            int adjustedTime = (int) (route.getEstimatedTime() * (1 + congestion * 0.6));
            scored.put("adjustedTime", adjustedTime);

            return scored;
        }).sorted((a, b) -> Double.compare((Double) b.get("aiScore"), (Double) a.get("aiScore")))
          .collect(Collectors.toList());

        // 标记推荐路线
        if (!scoredRoutes.isEmpty()) {
            scoredRoutes.get(0).put("recommended", true);
        }

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("buildingId", buildingId);
        result.put("currentFloor", currentFloor);
        result.put("personCount", personCount);
        result.put("routes", scoredRoutes);
        result.put("recommendation", scoredRoutes.get(0).get("routeName") + " (AI评分: " + scoredRoutes.get(0).get("aiScore") + ")");
        result.put("analysisTime", System.currentTimeMillis());

        return ApiResponse.success(result);
    }
}
