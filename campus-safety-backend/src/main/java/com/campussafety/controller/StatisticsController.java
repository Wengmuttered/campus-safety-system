package com.campussafety.controller;

import com.campussafety.entity.*;
import com.campussafety.repository.*;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * 综合数据统计分析 — Dashboard和报表数据源
 */
@RestController
@RequestMapping("/api/statistics")
@RequiredArgsConstructor
public class StatisticsController {

    private final EmergencyEventRepository eventRepository;
    private final InspectionTaskRepository inspectionRepository;
    private final HazardReportRepository hazardRepository;
    private final EmergencySupplyRepository supplyRepository;
    private final DutyScheduleRepository dutyRepository;
    private final TrainingCourseRepository courseRepository;
    private final TrainingRecordRepository recordRepository;
    private final NoticeRepository noticeRepository;
    private final UserRepository userRepository;

    /**
     * 安全总览统计
     */
    @GetMapping("/overview")
    public ApiResponse<Map<String, Object>> overview(@RequestParam(defaultValue = "1") Long campusId) {
        Map<String, Object> data = new LinkedHashMap<>();

        // 巡检统计
        Map<String, Long> inspection = new LinkedHashMap<>();
        inspection.put("total", inspectionRepository.count());
        inspection.put("pending", inspectionRepository.countByCampusIdAndStatus(campusId, InspectionTask.InspectionStatus.PENDING));
        inspection.put("inProgress", inspectionRepository.countByCampusIdAndStatus(campusId, InspectionTask.InspectionStatus.IN_PROGRESS));
        inspection.put("completed", inspectionRepository.countByCampusIdAndStatus(campusId, InspectionTask.InspectionStatus.COMPLETED));
        inspection.put("abnormal", inspectionRepository.countByCampusIdAndResult(campusId, InspectionTask.InspectionResult.ABNORMAL));
        data.put("inspection", inspection);

        // 隐患统计
        Map<String, Long> hazard = new LinkedHashMap<>();
        hazard.put("total", hazardRepository.count());
        hazard.put("reported", hazardRepository.countByCampusIdAndStatus(campusId, HazardReport.HazardStatus.REPORTED));
        hazard.put("rectifying", hazardRepository.countByCampusIdAndStatus(campusId, HazardReport.HazardStatus.RECTIFYING));
        hazard.put("closed", hazardRepository.countByCampusIdAndStatus(campusId, HazardReport.HazardStatus.CLOSED));
        hazard.put("minor", hazardRepository.countByCampusIdAndLevel(campusId, HazardReport.HazardLevel.MINOR));
        hazard.put("major", hazardRepository.countByCampusIdAndLevel(campusId, HazardReport.HazardLevel.MAJOR));
        hazard.put("critical", hazardRepository.countByCampusIdAndLevel(campusId, HazardReport.HazardLevel.CRITICAL));
        data.put("hazard", hazard);

        // 物资统计
        Map<String, Object> supply = new LinkedHashMap<>();
        supply.put("total", supplyRepository.count());
        supply.put("lowStock", supplyRepository.findByCampusIdAndStatus(campusId, EmergencySupply.SupplyStatus.LOW_STOCK).size());
        supply.put("expired", supplyRepository.findByCampusIdAndStatus(campusId, EmergencySupply.SupplyStatus.EXPIRED).size());
        data.put("supply", supply);

        // 培训统计
        Map<String, Object> training = new LinkedHashMap<>();
        training.put("totalCourses", courseRepository.count());
        training.put("totalRecords", recordRepository.count());
        data.put("training", training);

        // 用户统计
        Map<String, Long> user = new LinkedHashMap<>();
        user.put("total", userRepository.count());
        data.put("user", user);

        // 事件统计
        Map<String, Long> event = new LinkedHashMap<>();
        event.put("total", eventRepository.count());
        event.put("active", eventRepository.countByCampusIdAndStatus(campusId, EmergencyEvent.EventStatus.IN_PROGRESS));
        data.put("event", event);

        return ApiResponse.success(data);
    }

    /**
     * 隐患分类统计（饼图数据）
     */
    @GetMapping("/hazard-by-type")
    public ApiResponse<List<Map<String, Object>>> hazardByType(@RequestParam(defaultValue = "1") Long campusId) {
        List<Map<String, Object>> result = new ArrayList<>();
        for (HazardReport.HazardType type : HazardReport.HazardType.values()) {
            Map<String, Object> item = new HashMap<>();
            item.put("type", type.name());
            item.put("label", getHazardTypeLabel(type));
            // count all hazards of this type for this campus
            item.put("count", hazardRepository.findByCampusIdOrderByCreatedAtDesc(campusId, org.springframework.data.domain.PageRequest.of(0, 9999))
                    .getContent().stream().filter(h -> h.getType() == type).count());
            result.add(item);
        }
        return ApiResponse.success(result);
    }

    /**
     * 物资分类统计
     */
    @GetMapping("/supply-by-category")
    public ApiResponse<List<Map<String, Object>>> supplyByCategory(@RequestParam(defaultValue = "1") Long campusId) {
        List<Map<String, Object>> result = new ArrayList<>();
        for (EmergencySupply.SupplyCategory cat : EmergencySupply.SupplyCategory.values()) {
            long count = supplyRepository.findByCampusIdAndCategoryOrderByCreatedAtDesc(campusId, cat, org.springframework.data.domain.PageRequest.of(0, 9999))
                    .getTotalElements();
            if (count > 0) {
                Map<String, Object> item = new HashMap<>();
                item.put("category", cat.name());
                item.put("label", getSupplyCategoryLabel(cat));
                item.put("count", count);
                result.add(item);
            }
        }
        return ApiResponse.success(result);
    }

    private String getHazardTypeLabel(HazardReport.HazardType type) {
        return switch (type) {
            case FIRE -> "火灾隐患";
            case ELECTRICAL -> "电气隐患";
            case BUILDING -> "建筑隐患";
            case CHEMICAL -> "化学品隐患";
            case TRAFFIC -> "交通隐患";
            case FOOD -> "食品安全";
            case OTHER -> "其他";
        };
    }

    private String getSupplyCategoryLabel(EmergencySupply.SupplyCategory cat) {
        return switch (cat) {
            case FIRE_EQUIPMENT -> "消防器材";
            case MEDICAL -> "急救设备";
            case PROTECTION -> "防护用品";
            case COMMUNICATION -> "通讯设备";
            case LIGHTING -> "照明设备";
            case RESCUE -> "救援工具";
            case OTHER -> "其他";
        };
    }
}
