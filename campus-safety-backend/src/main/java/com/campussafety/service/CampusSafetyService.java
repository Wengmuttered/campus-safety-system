package com.campussafety.service;

import com.campussafety.dto.DashboardStats;
import com.campussafety.dto.SosRequest;
import com.campussafety.entity.*;
import com.campussafety.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CampusSafetyService {

    private final CampusRepository campusRepository;
    private final BuildingRepository buildingRepository;
    private final SafetyPointRepository safetyPointRepository;
    private final EmergencyEventRepository eventRepository;
    private final AlertRecordRepository alertRepository;
    private final EvacuationRouteRepository evacuationRouteRepository;
    private final DrillPlanRepository drillPlanRepository;
    private final UserRepository userRepository;
    private final SimpMessagingTemplate messagingTemplate;
    private final AiAnalysisService aiAnalysisService;

    // ========== 校区与地图 ==========

    public List<Campus> getAllCampuses() {
        return campusRepository.findAll();
    }

    public Campus getCampusById(Long id) {
        return campusRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("校区不存在"));
    }

    public List<Building> getBuildingsByCampus(Long campusId) {
        return buildingRepository.findByCampusId(campusId);
    }

    // ========== 安全点位 ==========

    public List<SafetyPoint> getSafetyPointsByCampus(Long campusId) {
        return safetyPointRepository.findByCampusId(campusId);
    }

    public SafetyPoint createSafetyPoint(SafetyPoint point) {
        return safetyPointRepository.save(point);
    }

    public SafetyPoint updateSafetyPoint(Long id, SafetyPoint point) {
        SafetyPoint existing = safetyPointRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("安全点位不存在"));
        existing.setName(point.getName());
        existing.setType(point.getType());
        existing.setLng(point.getLng());
        existing.setLat(point.getLat());
        existing.setFloor(point.getFloor());
        existing.setStatus(point.getStatus());
        existing.setDescription(point.getDescription());
        return safetyPointRepository.save(existing);
    }

    public void deleteSafetyPoint(Long id) {
        safetyPointRepository.deleteById(id);
    }

    // ========== 一键求助 ==========

    public AlertRecord createSosAlert(SosRequest request, String username) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("用户不存在"));

        AlertRecord alert = AlertRecord.builder()
                .userId(user.getId())
                .alertType(request.getAlertType())
                .lng(request.getLng())
                .lat(request.getLat())
                .locationDesc(request.getLocationDesc())
                .content(request.getContent())
                .status(AlertRecord.AlertStatus.PENDING)
                .build();

        AlertRecord saved = alertRepository.save(alert);

        // WebSocket实时推送给安保人员
        Map<String, Object> alertMsg = new HashMap<>();
        alertMsg.put("type", "SOS_ALERT");
        alertMsg.put("alertId", saved.getId());
        alertMsg.put("alertType", saved.getAlertType());
        alertMsg.put("username", username);
        alertMsg.put("realName", user.getRealName());
        alertMsg.put("lng", saved.getLng());
        alertMsg.put("lat", saved.getLat());
        alertMsg.put("content", saved.getContent());
        alertMsg.put("locationDesc", saved.getLocationDesc());
        alertMsg.put("time", saved.getCreatedAt());
        messagingTemplate.convertAndSend("/topic/alerts", alertMsg);

        return saved;
    }

    public Page<AlertRecord> getAlertsByStatus(AlertRecord.AlertStatus status, Pageable pageable) {
        return alertRepository.findByStatusOrderByCreatedAtDesc(status, pageable);
    }

    public AlertRecord handleAlert(Long alertId, Long handlerId, String note) {
        AlertRecord alert = alertRepository.findById(alertId)
                .orElseThrow(() -> new RuntimeException("报警记录不存在"));
        alert.setStatus(AlertRecord.AlertStatus.IN_PROGRESS);
        alert.setHandledBy(handlerId);
        alert.setHandleNote(note);
        return alertRepository.save(alert);
    }

    // ========== 事件管理 ==========

    public Page<EmergencyEvent> getEvents(Long campusId, EmergencyEvent.EventStatus status, Pageable pageable) {
        if (status != null) {
            return eventRepository.findByCampusIdAndStatusOrderByCreatedAtDesc(campusId, status, pageable);
        }
        return eventRepository.findByCampusIdOrderByCreatedAtDesc(campusId, pageable);
    }

    public EmergencyEvent createEvent(EmergencyEvent event) {
        EmergencyEvent saved = eventRepository.save(event);

        // 如是高严重级别，WebSocket推送预警
        if (event.getSeverity() == EmergencyEvent.SeverityLevel.HIGH ||
            event.getSeverity() == EmergencyEvent.SeverityLevel.CRITICAL) {

            Map<String, Object> warning = new HashMap<>();
            warning.put("type", "EMERGENCY_WARNING");
            warning.put("eventId", saved.getId());
            warning.put("eventType", saved.getType());
            warning.put("severity", saved.getSeverity());
            warning.put("title", saved.getTitle());
            warning.put("description", saved.getDescription());
            warning.put("lng", saved.getLng());
            warning.put("lat", saved.getLat());
            messagingTemplate.convertAndSend("/topic/notifications", warning);
        }
        // 推送事件数据给 AI 服务更新模型
        if (saved.getLng() != null && saved.getLat() != null) {
            aiAnalysisService.ingestEvent(
                saved.getType().name(), saved.getSeverity().name(),
                saved.getLocationDesc() != null ? saved.getLocationDesc() : "未知位置",
                saved.getLng(), saved.getLat(),
                saved.getOccurredAt() != null ? saved.getOccurredAt().toString() : java.time.LocalDateTime.now().toString()
            );
        }

        return saved;
    }

    public EmergencyEvent updateEventStatus(Long id, EmergencyEvent.EventStatus status) {
        EmergencyEvent event = eventRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("事件不存在"));
        event.setStatus(status);
        return eventRepository.save(event);
    }

    // ========== 疏散路线 ==========

    public List<EvacuationRoute> getRoutesByBuilding(Long buildingId) {
        return evacuationRouteRepository.findByBuildingId(buildingId);
    }

    // ========== 演练计划 ==========

    public List<DrillPlan> getDrillsByCampus(Long campusId) {
        return drillPlanRepository.findByCampusIdOrderByScheduledAtDesc(campusId);
    }

    public DrillPlan createDrill(DrillPlan plan) {
        return drillPlanRepository.save(plan);
    }

    public DrillPlan updateDrillStatus(Long id, DrillPlan.DrillStatus status) {
        DrillPlan plan = drillPlanRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("演练计划不存在"));
        plan.setStatus(status);
        return drillPlanRepository.save(plan);
    }

    public DrillPlan updateDrillSummary(Long id, String summary) {
        DrillPlan plan = drillPlanRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("演练计划不存在"));
        plan.setSummary(summary);
        return drillPlanRepository.save(plan);
    }

    // ========== 仪表盘统计 ==========

    public DashboardStats getDashboardStats(Long campusId) {
        return DashboardStats.builder()
                .totalEvents(eventRepository.count())
                .activeEvents(eventRepository.countByCampusIdAndStatus(campusId, EmergencyEvent.EventStatus.IN_PROGRESS))
                .pendingAlerts(alertRepository.countByStatus(AlertRecord.AlertStatus.PENDING))
                .totalSafetyPoints(safetyPointRepository.findByCampusId(campusId).size())
                .totalBuildings(buildingRepository.findByCampusId(campusId).size())
                .plannedDrills(drillPlanRepository.findByStatus(DrillPlan.DrillStatus.PLANNED).size())
                .build();
    }
}
