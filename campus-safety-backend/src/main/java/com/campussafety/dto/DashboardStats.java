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
}
