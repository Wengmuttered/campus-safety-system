package com.campussafety.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DashboardStats {
    private long totalEvents;
    private long activeEvents;
    private long pendingAlerts;
    private long totalSafetyPoints;
    private long totalBuildings;
    private long plannedDrills;
    // 新增统计维度
    private long pendingInspections;   // 待执行巡检
    private long openHazards;          // 未关闭隐患
    private long lowStockSupplies;     // 库存预警物资数
    private long todayOnDuty;          // 今日值班人数
    private long publishedNotices;     // 已发布通知数
    private long activeCourses;        // 在线课程数
}
