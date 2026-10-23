package com.campussafety.config;

import com.campussafety.entity.*;
import com.campussafety.repository.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Component
@RequiredArgsConstructor
@Slf4j
public class DataInitializer implements CommandLineRunner {

    private final UserRepository userRepository;
    private final CampusRepository campusRepository;
    private final BuildingRepository buildingRepository;
    private final SafetyPointRepository safetyPointRepository;
    private final EvacuationRouteRepository evacuationRouteRepository;
    private final PasswordEncoder passwordEncoder;
    private final InspectionTaskRepository inspectionTaskRepository;
    private final HazardReportRepository hazardReportRepository;
    private final EmergencyPlanRepository emergencyPlanRepository;
    private final EmergencySupplyRepository emergencySupplyRepository;
    private final DutyScheduleRepository dutyScheduleRepository;
    private final NoticeRepository noticeRepository;
    private final TrainingCourseRepository trainingCourseRepository;
    private final SystemConfigRepository systemConfigRepository;
    private final EmergencyEventRepository emergencyEventRepository;
    private final AlertRecordRepository alertRecordRepository;
    private final DrillPlanRepository drillPlanRepository;

    @Override
    public void run(String... args) {
        if (userRepository.count() > 0) {
            log.info("数据库已有数据，跳过初始化");
            return;
        }
        log.info("开始初始化海南科技职业大学演示数据...");

        // ==================== 第一校区：海南科技职业大学美兰校区 ====================
        Campus campus = campusRepository.save(Campus.builder()
                .name("海南科技职业大学美兰校区").address("海南省海口市美兰区琼山大道18号")
                .centerLng(110.4032).centerLat(20.0449).defaultAltitude(1500.0).build());
        Long cid = campus.getId();

        // 用户
        userRepository.save(User.builder().username("admin").password(passwordEncoder.encode("admin123"))
                .realName("系统管理员").phone("13800000001").role(User.UserRole.ADMIN).campusId(cid).enabled(true).build());
        userRepository.save(User.builder().username("security01").password(passwordEncoder.encode("123456"))
                .realName("张安全").phone("13800000002").role(User.UserRole.SECURITY).campusId(cid).department("保卫处").enabled(true).build());
        userRepository.save(User.builder().username("student01").password(passwordEncoder.encode("123456"))
                .realName("李同学").phone("13800000003").role(User.UserRole.STUDENT).campusId(cid).department("信息工程学院").enabled(true).build());
        userRepository.save(User.builder().username("teacher01").password(passwordEncoder.encode("123456"))
                .realName("王老师").phone("13800000004").role(User.UserRole.TEACHER).campusId(cid).department("化学与环境工程学院").enabled(true).build());

        // 建筑物 — 美兰校区（琼山大道 18 号，坐标中心 110.4032 / 20.0449）
        Building[] blds = {
            buildingRepository.save(Building.builder().name("信息工程学院教学楼").campusId(cid).lng(110.4034).lat(20.0451).height(30.0).floorCount(6).buildingType("教学楼").capacity(2000).build()),
            buildingRepository.save(Building.builder().name("图书馆").campusId(cid).lng(110.402).lat(20.0447).height(25.0).floorCount(5).buildingType("图书馆").capacity(3000).build()),
            buildingRepository.save(Building.builder().name("第一学生食堂").campusId(cid).lng(110.4044).lat(20.0437).height(12.0).floorCount(3).buildingType("食堂").capacity(1500).build()),
            buildingRepository.save(Building.builder().name("综合体育馆").campusId(cid).lng(110.4004).lat(20.0461).height(20.0).floorCount(2).buildingType("体育场馆").capacity(5000).build()),
            buildingRepository.save(Building.builder().name("学生公寓1号楼").campusId(cid).lng(110.4058).lat(20.0431).height(35.0).floorCount(7).buildingType("宿舍").capacity(500).build()),
            buildingRepository.save(Building.builder().name("行政办公楼").campusId(cid).lng(110.4026).lat(20.0457).height(18.0).floorCount(4).buildingType("办公楼").capacity(300).build()),
            buildingRepository.save(Building.builder().name("化学与环境工程学院实验楼").campusId(cid).lng(110.404).lat(20.0453).height(22.0).floorCount(4).buildingType("实验楼").capacity(600).build())
        };

        // 安全点位
        safetyPointRepository.save(SafetyPoint.builder().name("信息工程学院教学楼1楼消防栓").type(SafetyPoint.PointType.FIRE_HYDRANT).lng(110.4035).lat(20.0452).floor(1).buildingId(blds[0].getId()).campusId(cid).status(SafetyPoint.PointStatus.NORMAL).build());
        safetyPointRepository.save(SafetyPoint.builder().name("图书馆AED").type(SafetyPoint.PointType.AED).lng(110.4021).lat(20.0448).floor(1).buildingId(blds[1].getId()).campusId(cid).status(SafetyPoint.PointStatus.NORMAL).build());
        safetyPointRepository.save(SafetyPoint.builder().name("田径场集合点").type(SafetyPoint.PointType.ASSEMBLY_POINT).lng(110.4007).lat(20.0463).floor(0).campusId(cid).status(SafetyPoint.PointStatus.NORMAL).description("地震应急集合点").build());
        safetyPointRepository.save(SafetyPoint.builder().name("东门安全出口").type(SafetyPoint.PointType.EXIT).lng(110.4064).lat(20.0449).floor(0).campusId(cid).status(SafetyPoint.PointStatus.NORMAL).build());
        safetyPointRepository.save(SafetyPoint.builder().name("第一食堂灭火器").type(SafetyPoint.PointType.FIRE_EXTINGUISHER).lng(110.4045).lat(20.0438).floor(1).buildingId(blds[2].getId()).campusId(cid).status(SafetyPoint.PointStatus.NORMAL).build());
        safetyPointRepository.save(SafetyPoint.builder().name("学生公寓1号楼急救箱").type(SafetyPoint.PointType.FIRST_AID).lng(110.4059).lat(20.0432).floor(1).buildingId(blds[4].getId()).campusId(cid).status(SafetyPoint.PointStatus.NORMAL).build());
        safetyPointRepository.save(SafetyPoint.builder().name("行政办公楼监控").type(SafetyPoint.PointType.CAMERA).lng(110.4027).lat(20.0458).floor(0).buildingId(blds[5].getId()).campusId(cid).status(SafetyPoint.PointStatus.NORMAL).build());
        safetyPointRepository.save(SafetyPoint.builder().name("图书馆报警按钮").type(SafetyPoint.PointType.ALARM_BUTTON).lng(110.4019).lat(20.0446).floor(1).buildingId(blds[1].getId()).campusId(cid).status(SafetyPoint.PointStatus.NORMAL).build());
        safetyPointRepository.save(SafetyPoint.builder().name("化环学院实验楼洗眼器").type(SafetyPoint.PointType.FIRST_AID).lng(110.4041).lat(20.0454).floor(3).buildingId(blds[6].getId()).campusId(cid).status(SafetyPoint.PointStatus.NORMAL).description("应急洗眼器/喷淋").build());

        // 疏散路线
        evacuationRouteRepository.save(EvacuationRoute.builder().name("信息工程学院教学楼北侧楼梯疏散路线").buildingId(blds[0].getId()).campusId(cid).startFloor(6).distance(120.0).estimatedTime(90).capacity(200).accessible(false).description("从6楼北侧楼梯依次下行至1楼北门出口").build());
        evacuationRouteRepository.save(EvacuationRoute.builder().name("信息工程学院教学楼南侧无障碍路线").buildingId(blds[0].getId()).campusId(cid).startFloor(6).distance(150.0).estimatedTime(120).capacity(150).accessible(true).description("从6楼经南侧无障碍电梯至1楼").build());
        evacuationRouteRepository.save(EvacuationRoute.builder().name("图书馆中央楼梯疏散路线").buildingId(blds[1].getId()).campusId(cid).startFloor(5).distance(100.0).estimatedTime(80).capacity(300).accessible(false).description("从5楼中央楼梯下行经正门疏散至前广场").build());
        evacuationRouteRepository.save(EvacuationRoute.builder().name("图书馆消防通道路线").buildingId(blds[1].getId()).campusId(cid).startFloor(5).distance(90.0).estimatedTime(70).capacity(200).accessible(false).description("从5楼西侧消防通道下行").build());
        evacuationRouteRepository.save(EvacuationRoute.builder().name("第一食堂主出口疏散路线").buildingId(blds[2].getId()).campusId(cid).startFloor(3).distance(60.0).estimatedTime(45).capacity(500).accessible(true).description("从3楼经主楼梯下行").build());
        evacuationRouteRepository.save(EvacuationRoute.builder().name("综合体育馆四向疏散路线").buildingId(blds[3].getId()).campusId(cid).startFloor(2).distance(80.0).estimatedTime(60).capacity(1000).accessible(true).description("四个安全出口同时疏散").build());
        evacuationRouteRepository.save(EvacuationRoute.builder().name("学生公寓1号楼楼梯疏散路线").buildingId(blds[4].getId()).campusId(cid).startFloor(7).distance(140.0).estimatedTime(100).capacity(250).accessible(false).description("从7楼经两侧楼梯下行").build());
        evacuationRouteRepository.save(EvacuationRoute.builder().name("行政办公楼疏散路线").buildingId(blds[5].getId()).campusId(cid).startFloor(4).distance(70.0).estimatedTime(50).capacity(150).accessible(true).description("从4楼经无障碍电梯下行").build());

        // ==================== 应急事件 ====================
        emergencyEventRepository.save(EmergencyEvent.builder()
                .type(EmergencyEvent.EventType.FIRE).severity(EmergencyEvent.SeverityLevel.HIGH)
                .title("第一食堂后厨油烟起火").description("第一食堂2楼后厨炒菜时油锅起火，值班人员使用灭火器及时扑灭，无人员伤亡。")
                .lng(110.4044).lat(20.0437).locationDesc("第一学生食堂2楼后厨")
                .reporterId(2L).handlerId(2L).campusId(cid)
                .status(EmergencyEvent.EventStatus.CLOSED).affectedRadius(50.0).casualties(0)
                .occurredAt(LocalDateTime.now().minusDays(3).withHour(11).withMinute(35))
                .resolvedAt(LocalDateTime.now().minusDays(3).withHour(12).withMinute(10))
                .build());

        emergencyEventRepository.save(EmergencyEvent.builder()
                .type(EmergencyEvent.EventType.MEDICAL).severity(EmergencyEvent.SeverityLevel.MEDIUM)
                .title("综合体育馆学生训练晕倒").description("一名学生在综合体育馆篮球训练中突然晕倒，校医务室已到场处置，学生已送医检查。")
                .lng(110.4004).lat(20.0461).locationDesc("综合体育馆篮球场")
                .reporterId(3L).handlerId(2L).campusId(cid)
                .status(EmergencyEvent.EventStatus.RESOLVED).affectedRadius(30.0).casualties(1)
                .occurredAt(LocalDateTime.now().minusDays(2).withHour(16).withMinute(20))
                .resolvedAt(LocalDateTime.now().minusDays(2).withHour(17).withMinute(0))
                .build());

        emergencyEventRepository.save(EmergencyEvent.builder()
                .type(EmergencyEvent.EventType.CHEMICAL_LEAK).severity(EmergencyEvent.SeverityLevel.CRITICAL)
                .title("化学与环境工程学院实验楼试剂泄漏").description("化环学院实验楼304室有机溶剂瓶意外跌落破碎，少量化学品泄漏，已启动应急预案进行处置。")
                .lng(110.404).lat(20.0453).locationDesc("化学与环境工程学院实验楼304室")
                .reporterId(4L).handlerId(2L).campusId(cid)
                .status(EmergencyEvent.EventStatus.IN_PROGRESS).affectedRadius(100.0).casualties(0)
                .occurredAt(LocalDateTime.now().minusHours(2))
                .build());

        emergencyEventRepository.save(EmergencyEvent.builder()
                .type(EmergencyEvent.EventType.POWER_OUTAGE).severity(EmergencyEvent.SeverityLevel.MEDIUM)
                .title("信息工程学院教学楼4-6层突发停电").description("教学楼高层区域突然断电，初步判断为配电箱故障，后勤部门已派人排查。")
                .lng(110.4034).lat(20.0451).locationDesc("信息工程学院教学楼4-6层")
                .reporterId(3L).campusId(cid)
                .status(EmergencyEvent.EventStatus.CONFIRMED).affectedRadius(80.0).casualties(0)
                .occurredAt(LocalDateTime.now().minusHours(1))
                .build());

        emergencyEventRepository.save(EmergencyEvent.builder()
                .type(EmergencyEvent.EventType.OTHER).severity(EmergencyEvent.SeverityLevel.LOW)
                .title("图书馆自习室笔记本电脑遗失").description("学生报告图书馆3楼自习室笔记本电脑疑似被盗，保卫处已接报。")
                .lng(110.402).lat(20.0447).locationDesc("图书馆3楼自习室")
                .reporterId(3L).campusId(cid)
                .status(EmergencyEvent.EventStatus.REPORTED).casualties(0)
                .occurredAt(LocalDateTime.now().minusMinutes(30))
                .build());

        emergencyEventRepository.save(EmergencyEvent.builder()
                .type(EmergencyEvent.EventType.TRAFFIC).severity(EmergencyEvent.SeverityLevel.LOW)
                .title("东门电动车与行人轻微碰擦").description("东门口一辆电动车与行人发生轻微碰擦，双方均无大碍，保卫处已协调处理。")
                .lng(110.4064).lat(20.0449).locationDesc("校园东门")
                .reporterId(2L).handlerId(2L).campusId(cid)
                .status(EmergencyEvent.EventStatus.CLOSED).affectedRadius(20.0).casualties(0)
                .occurredAt(LocalDateTime.now().minusDays(7).withHour(8).withMinute(15))
                .resolvedAt(LocalDateTime.now().minusDays(7).withHour(9).withMinute(0))
                .build());

        // ==================== 报警记录 ====================
        alertRecordRepository.save(AlertRecord.builder()
                .userId(3L).alertType(AlertRecord.AlertType.SOS)
                .lng(110.402).lat(20.0447).locationDesc("图书馆3楼")
                .content("有人在图书馆突然昏倒，请速来！")
                .status(AlertRecord.AlertStatus.RESOLVED).handledBy(2L)
                .handleNote("已到场处置，学生已恢复意识")
                .build());
        alertRecordRepository.save(AlertRecord.builder()
                .userId(4L).alertType(AlertRecord.AlertType.FIRE_ALARM)
                .lng(110.404).lat(20.0453).locationDesc("化学与环境工程学院实验楼3楼")
                .content("实验室烟雾报警器触发")
                .status(AlertRecord.AlertStatus.IN_PROGRESS).handledBy(2L)
                .build());
        alertRecordRepository.save(AlertRecord.builder()
                .userId(3L).alertType(AlertRecord.AlertType.SECURITY)
                .lng(110.4058).lat(20.0431).locationDesc("学生公寓1号楼楼下")
                .content("宿舍楼下有可疑人员徘徊")
                .status(AlertRecord.AlertStatus.PENDING)
                .build());

        // ==================== 应急演练计划 ====================
        drillPlanRepository.save(DrillPlan.builder()
                .name("2026年春季全校消防疏散演练")
                .scenarioType(DrillPlan.ScenarioType.FIRE).campusId(cid)
                .description("模拟信息工程学院教学楼发生火灾，全体师生参与疏散演练。演练覆盖教学楼、图书馆、食堂三栋建筑，检验各楼疏散路线和应急响应速度。")
                .participantCount(1500)
                .centerLng(110.4034).centerLat(20.0451).radius(500.0)
                .scheduledAt(LocalDateTime.now().minusDays(20).withHour(10).withMinute(0))
                .status(DrillPlan.DrillStatus.COMPLETED)
                .summary("演练顺利完成。全楼疏散用时4分32秒，达到预期目标。发现2处疏散标识不清晰需更换。")
                .build());

        drillPlanRepository.save(DrillPlan.builder()
                .name("地震避险与紧急疏散演练")
                .scenarioType(DrillPlan.ScenarioType.EARTHQUAKE).campusId(cid)
                .description("模拟校区发生5.5级地震，师生掌握就地避险和有序疏散至田径场集合点的流程。")
                .participantCount(2000)
                .centerLng(110.4032).centerLat(20.0449).radius(800.0)
                .scheduledAt(LocalDateTime.now().minusDays(35).withHour(14).withMinute(30))
                .status(DrillPlan.DrillStatus.COMPLETED)
                .summary("演练完成。就地避险响应率98%，疏散至集合点用时6分15秒。建议学生公寓区增设疏散引导员。")
                .build());

        drillPlanRepository.save(DrillPlan.builder()
                .name("化学品泄漏应急处置演练")
                .scenarioType(DrillPlan.ScenarioType.CHEMICAL).campusId(cid)
                .description("模拟化环学院实验楼发生有毒气体泄漏，检验应急预案启动、人员疏散、专业处置队伍到场及环境监测全流程。")
                .participantCount(300)
                .centerLng(110.404).centerLat(20.0453).radius(200.0)
                .scheduledAt(LocalDateTime.now().minusHours(1))
                .status(DrillPlan.DrillStatus.IN_PROGRESS)
                .build());

        drillPlanRepository.save(DrillPlan.builder()
                .name("校园综合应急演练(联合消防119)")
                .scenarioType(DrillPlan.ScenarioType.COMPREHENSIVE).campusId(cid)
                .description("联合海口市消防救援支队开展的综合应急演练，涵盖火灾扑救、人员搜救、伤员急救转运、媒体应对等多科目联合训练。")
                .participantCount(500)
                .centerLng(110.4032).centerLat(20.0449).radius(1000.0)
                .scheduledAt(LocalDateTime.now().plusDays(7).withHour(9).withMinute(0))
                .status(DrillPlan.DrillStatus.PLANNED)
                .build());

        drillPlanRepository.save(DrillPlan.builder()
                .name("校园防洪排涝演练")
                .scenarioType(DrillPlan.ScenarioType.FLOOD).campusId(cid)
                .description("模拟台风暴雨导致校园低洼地区积水，检验排水设施和应急转移能力。")
                .participantCount(200)
                .centerLng(110.4044).centerLat(20.0437).radius(400.0)
                .scheduledAt(LocalDateTime.now().minusDays(5).withHour(15).withMinute(0))
                .status(DrillPlan.DrillStatus.CANCELLED)
                .summary("因当日实际台风暴雨天气，出于安全考虑取消演练，改期另行安排。")
                .build());

        // 巡检任务
        inspectionTaskRepository.save(InspectionTask.builder().title("信息工程学院教学楼消防设施月度巡检").type(InspectionTask.InspectionType.FIRE).assigneeId(2L).campusId(cid).createdBy(1L).area("信息工程学院教学楼1-6层").scheduledAt(LocalDateTime.now().plusDays(1)).status(InspectionTask.InspectionStatus.PENDING).build());
        inspectionTaskRepository.save(InspectionTask.builder().title("第一食堂食品安全巡检").type(InspectionTask.InspectionType.FOOD).assigneeId(2L).campusId(cid).createdBy(1L).area("第一学生食堂1-3层").scheduledAt(LocalDateTime.now().plusDays(2)).status(InspectionTask.InspectionStatus.PENDING).build());
        inspectionTaskRepository.save(InspectionTask.builder().title("学生公寓电气安全检查").type(InspectionTask.InspectionType.ELECTRICAL).assigneeId(2L).campusId(cid).createdBy(1L).area("学生公寓1-3号楼").scheduledAt(LocalDateTime.now().minusDays(1)).status(InspectionTask.InspectionStatus.COMPLETED).result(InspectionTask.InspectionResult.ABNORMAL).issueCount(3).completedAt(LocalDateTime.now().minusHours(6)).remark("发现3处违规使用大功率电器").build());
        inspectionTaskRepository.save(InspectionTask.builder().title("化环学院实验楼安全综合巡检").type(InspectionTask.InspectionType.LABORATORY).assigneeId(2L).campusId(cid).createdBy(1L).area("化学与环境工程学院实验楼").scheduledAt(LocalDateTime.now()).status(InspectionTask.InspectionStatus.IN_PROGRESS).startedAt(LocalDateTime.now().minusHours(1)).build());

        // 隐患报告
        hazardReportRepository.save(HazardReport.builder().title("信息工程学院教学楼3楼走廊灭火器过期").type(HazardReport.HazardType.FIRE).level(HazardReport.HazardLevel.MINOR).description("3楼东侧走廊2个灭火器已超过有效期").locationDesc("信息工程学院教学楼3楼东侧走廊").lng(110.4036).lat(20.0452).reporterId(2L).campusId(cid).status(HazardReport.HazardStatus.RECTIFYING).deadline(LocalDateTime.now().plusDays(7)).build());
        hazardReportRepository.save(HazardReport.builder().title("第一食堂后厨排烟系统故障").type(HazardReport.HazardType.FIRE).level(HazardReport.HazardLevel.MAJOR).description("第一食堂2楼后厨排烟系统工作异常").locationDesc("第一食堂2楼后厨").lng(110.4045).lat(20.0438).reporterId(2L).campusId(cid).status(HazardReport.HazardStatus.CONFIRMED).deadline(LocalDateTime.now().plusDays(3)).build());
        hazardReportRepository.save(HazardReport.builder().title("学生公寓区路灯损坏").type(HazardReport.HazardType.ELECTRICAL).level(HazardReport.HazardLevel.MINOR).description("公寓区北侧3盏路灯损坏").locationDesc("学生公寓区北侧道路").lng(110.4058).lat(20.0433).reporterId(3L).campusId(cid).status(HazardReport.HazardStatus.REPORTED).build());

        // 应急预案
        emergencyPlanRepository.save(EmergencyPlan.builder().title("海科职大校园火灾应急预案").type(EmergencyPlan.PlanType.FIRE).level(EmergencyPlan.PlanLevel.SCHOOL).version("2.1").content("适用于海南科技职业大学校园内各类火灾事故的应急处置").campusId(cid).createdBy(1L).status(EmergencyPlan.PlanStatus.PUBLISHED).publishedAt(LocalDateTime.now().minusDays(30)).build());
        emergencyPlanRepository.save(EmergencyPlan.builder().title("海科职大地震应急疏散预案").type(EmergencyPlan.PlanType.EARTHQUAKE).level(EmergencyPlan.PlanLevel.SCHOOL).version("1.0").content("适用于校园区域内发生地震时的紧急疏散和避险").campusId(cid).createdBy(1L).status(EmergencyPlan.PlanStatus.PUBLISHED).publishedAt(LocalDateTime.now().minusDays(60)).build());
        emergencyPlanRepository.save(EmergencyPlan.builder().title("化学与环境工程学院化学品泄漏预案").type(EmergencyPlan.PlanType.CHEMICAL).level(EmergencyPlan.PlanLevel.COLLEGE).version("1.0").content("适用于化学与环境工程学院实验楼内化学品泄漏事故的应急处置").campusId(cid).createdBy(1L).status(EmergencyPlan.PlanStatus.DRAFT).build());

        // 应急物资
        emergencySupplyRepository.save(EmergencySupply.builder().name("ABC干粉灭火器").category(EmergencySupply.SupplyCategory.FIRE_EQUIPMENT).model("MFZ/ABC4").quantity(120).unit("个").warehouseLocation("消防器材库A区").campusId(cid).expiryDate(LocalDate.now().plusYears(1)).status(EmergencySupply.SupplyStatus.NORMAL).manager("张安全").minStock(20).build());
        emergencySupplyRepository.save(EmergencySupply.builder().name("急救药箱").category(EmergencySupply.SupplyCategory.MEDICAL).model("标准型").quantity(30).unit("套").warehouseLocation("医务室仓库").campusId(cid).expiryDate(LocalDate.now().plusMonths(6)).status(EmergencySupply.SupplyStatus.NORMAL).manager("李医生").minStock(10).build());
        emergencySupplyRepository.save(EmergencySupply.builder().name("防毒面具").category(EmergencySupply.SupplyCategory.PROTECTION).model("3M 6200").quantity(6).unit("个").warehouseLocation("化学与环境工程学院实验楼B102").campusId(cid).expiryDate(LocalDate.now().plusMonths(3)).status(EmergencySupply.SupplyStatus.LOW_STOCK).manager("王老师").minStock(10).build());
        emergencySupplyRepository.save(EmergencySupply.builder().name("应急对讲机").category(EmergencySupply.SupplyCategory.COMMUNICATION).model("Motorola T82").quantity(12).unit("台").warehouseLocation("保卫处办公室").campusId(cid).status(EmergencySupply.SupplyStatus.NORMAL).manager("张安全").minStock(5).build());

        // 值班排班
        LocalDate today = LocalDate.now();
        dutyScheduleRepository.save(DutySchedule.builder().userId(2L).campusId(cid).dutyDate(today).shiftType(DutySchedule.ShiftType.DAY).area("美兰校区南区").startTime(LocalTime.of(8,0)).endTime(LocalTime.of(18,0)).status(DutySchedule.DutyStatus.ON_DUTY).build());
        dutyScheduleRepository.save(DutySchedule.builder().userId(2L).campusId(cid).dutyDate(today).shiftType(DutySchedule.ShiftType.NIGHT).area("美兰校区北区").startTime(LocalTime.of(18,0)).endTime(LocalTime.of(8,0)).status(DutySchedule.DutyStatus.SCHEDULED).build());
        dutyScheduleRepository.save(DutySchedule.builder().userId(2L).campusId(cid).dutyDate(today.plusDays(1)).shiftType(DutySchedule.ShiftType.DAY).area("美兰校区东区").startTime(LocalTime.of(8,0)).endTime(LocalTime.of(18,0)).status(DutySchedule.DutyStatus.SCHEDULED).build());

        // 通知公告
        noticeRepository.save(Notice.builder().title("关于开展春季校园安全大检查的通知").content("根据学校安全工作部署，定于本月15日至30日开展春季校园安全大检查活动。").type(Notice.NoticeType.NOTICE).priority(Notice.NoticePriority.IMPORTANT).publisherId(1L).campusId(cid).isTop(true).status(Notice.NoticeStatus.PUBLISHED).publishedAt(LocalDateTime.now().minusDays(2)).build());
        noticeRepository.save(Notice.builder().title("台风/暴雨预警：请注意防范").content("海南省气象台发布台风暴雨预警，请各单位做好防汛防风准备。").type(Notice.NoticeType.ALERT).priority(Notice.NoticePriority.URGENT).publisherId(1L).campusId(cid).isTop(true).status(Notice.NoticeStatus.PUBLISHED).publishedAt(LocalDateTime.now().minusHours(3)).build());
        noticeRepository.save(Notice.builder().title("消防安全培训报名通知").content("保卫处将于下周三举办消防安全培训课程，欢迎师生报名参加。").type(Notice.NoticeType.TRAINING).priority(Notice.NoticePriority.NORMAL).publisherId(1L).campusId(cid).isTop(false).status(Notice.NoticeStatus.PUBLISHED).publishedAt(LocalDateTime.now().minusDays(5)).build());

        // 培训课程
        trainingCourseRepository.save(TrainingCourse.builder().title("消防安全知识与灭火器使用").type(TrainingCourse.CourseType.FIRE).content("火灾成因与分类、灭火器使用方法、初起火灾扑救、火场逃生自救技巧").duration(45).mandatory(true).campusId(cid).createdBy(1L).status(TrainingCourse.CourseStatus.PUBLISHED).publishedAt(LocalDateTime.now().minusDays(15)).build());
        trainingCourseRepository.save(TrainingCourse.builder().title("地震避险与紧急疏散").type(TrainingCourse.CourseType.DISASTER).content("地震基本知识、室内避险姿势、有序疏散流程、震后自救互救").duration(30).mandatory(true).campusId(cid).createdBy(1L).status(TrainingCourse.CourseStatus.PUBLISHED).publishedAt(LocalDateTime.now().minusDays(20)).build());
        trainingCourseRepository.save(TrainingCourse.builder().title("急救技能-心肺复苏CPR").type(TrainingCourse.CourseType.FIRST_AID).content("心肺复苏原理、CPR操作步骤、AED使用方法").duration(60).mandatory(false).campusId(cid).createdBy(1L).status(TrainingCourse.CourseStatus.PUBLISHED).publishedAt(LocalDateTime.now().minusDays(10)).build());
        trainingCourseRepository.save(TrainingCourse.builder().title("实验室安全操作规范").type(TrainingCourse.CourseType.LAB_SAFETY).content("化学品分类与标识、个人防护装备使用、废弃物处理规范").duration(40).mandatory(true).campusId(cid).createdBy(1L).status(TrainingCourse.CourseStatus.DRAFT).build());

        // 系统默认配置
        systemConfigRepository.save(SystemConfig.builder().configKey("system.name").configValue("海南科技职业大学应急安全管理系统").category("SYSTEM").description("系统名称").build());
        systemConfigRepository.save(SystemConfig.builder().configKey("system.version").configValue("2.0.0").category("SYSTEM").description("系统版本").build());
        systemConfigRepository.save(SystemConfig.builder().configKey("system.contact").configValue("保卫处 0898-65355555").category("SYSTEM").description("紧急联系方式").build());
        systemConfigRepository.save(SystemConfig.builder().configKey("safety.inspection.interval").configValue("30").category("SAFETY").description("巡检间隔天数").build());
        systemConfigRepository.save(SystemConfig.builder().configKey("safety.hazard.deadline").configValue("7").category("SAFETY").description("隐患整改默认期限(天)").build());
        systemConfigRepository.save(SystemConfig.builder().configKey("safety.supply.alert.threshold").configValue("10").category("SAFETY").description("物资库存预警阈值").build());
        systemConfigRepository.save(SystemConfig.builder().configKey("notification.email.enabled").configValue("false").category("NOTIFICATION").description("邮件通知开关").build());
        systemConfigRepository.save(SystemConfig.builder().configKey("notification.sms.enabled").configValue("false").category("NOTIFICATION").description("短信通知开关").build());
        systemConfigRepository.save(SystemConfig.builder().configKey("upload.max.size").configValue("10").category("UPLOAD").description("最大上传文件大小(MB)").build());
        systemConfigRepository.save(SystemConfig.builder().configKey("upload.allowed.types").configValue("jpg,png,pdf,doc,docx,xls,xlsx").category("UPLOAD").description("允许的文件类型").build());

        // ==================== 第二校区：海南科技职业大学云龙校区 ====================
        Campus campus2 = campusRepository.save(Campus.builder()
                .name("海南科技职业大学云龙校区").address("海南省海口市琼山区云龙镇云定路118号")
                .centerLng(110.4573).centerLat(19.8598).defaultAltitude(1200.0).build());
        Long cid2 = campus2.getId();

        // 云龙校区建筑
        Building b2_1 = buildingRepository.save(Building.builder().name("机电工程学院教学楼").campusId(cid2).lng(110.4578).lat(19.8603).height(28.0).floorCount(5).buildingType("教学楼").capacity(1800).build());
        Building b2_2 = buildingRepository.save(Building.builder().name("图书信息中心").campusId(cid2).lng(110.4563).lat(19.8596).height(22.0).floorCount(4).buildingType("图书馆").capacity(2000).build());
        Building b2_3 = buildingRepository.save(Building.builder().name("学生公寓A栋").campusId(cid2).lng(110.4587).lat(19.859).height(30.0).floorCount(6).buildingType("宿舍").capacity(600).build());
        Building b2_4 = buildingRepository.save(Building.builder().name("云龙校区食堂").campusId(cid2).lng(110.4583).lat(19.8593).height(12.0).floorCount(2).buildingType("食堂").capacity(1200).build());
        Building b2_5 = buildingRepository.save(Building.builder().name("汽车与轨道交通学院实训楼").campusId(cid2).lng(110.4571).lat(19.8608).height(18.0).floorCount(3).buildingType("实训楼").capacity(800).build());

        // 云龙校区安全点位
        safetyPointRepository.save(SafetyPoint.builder().name("机电学院教学楼消防栓").type(SafetyPoint.PointType.FIRE_HYDRANT).lng(110.4579).lat(19.8604).floor(1).buildingId(b2_1.getId()).campusId(cid2).status(SafetyPoint.PointStatus.NORMAL).build());
        safetyPointRepository.save(SafetyPoint.builder().name("图信中心AED").type(SafetyPoint.PointType.AED).lng(110.4564).lat(19.8597).floor(1).buildingId(b2_2.getId()).campusId(cid2).status(SafetyPoint.PointStatus.NORMAL).build());
        safetyPointRepository.save(SafetyPoint.builder().name("云龙校区田径场集合点").type(SafetyPoint.PointType.ASSEMBLY_POINT).lng(110.4573).lat(19.8606).floor(0).campusId(cid2).status(SafetyPoint.PointStatus.NORMAL).description("地震应急集合点").build());
        safetyPointRepository.save(SafetyPoint.builder().name("学生公寓A栋灭火器").type(SafetyPoint.PointType.FIRE_EXTINGUISHER).lng(110.4588).lat(19.8591).floor(1).buildingId(b2_3.getId()).campusId(cid2).status(SafetyPoint.PointStatus.NORMAL).build());
        safetyPointRepository.save(SafetyPoint.builder().name("汽轨学院实训楼急救箱").type(SafetyPoint.PointType.FIRST_AID).lng(110.4572).lat(19.8609).floor(1).buildingId(b2_5.getId()).campusId(cid2).status(SafetyPoint.PointStatus.NORMAL).build());

        // 云龙校区疏散路线
        evacuationRouteRepository.save(EvacuationRoute.builder().name("机电学院教学楼主楼梯疏散路线").buildingId(b2_1.getId()).campusId(cid2).startFloor(5).distance(100.0).estimatedTime(75).capacity(300).accessible(false).description("从5楼经主楼梯下行至南门出口").build());
        evacuationRouteRepository.save(EvacuationRoute.builder().name("图信中心应急通道").buildingId(b2_2.getId()).campusId(cid2).startFloor(4).distance(80.0).estimatedTime(60).capacity(250).accessible(true).description("从4楼经无障碍电梯至一楼").build());
        evacuationRouteRepository.save(EvacuationRoute.builder().name("汽轨学院实训楼疏散路线").buildingId(b2_5.getId()).campusId(cid2).startFloor(3).distance(70.0).estimatedTime(55).capacity(400).accessible(true).description("从3楼经两侧楼梯下行至实训场疏散").build());

        // 云龙校区事件
        emergencyEventRepository.save(EmergencyEvent.builder()
                .type(EmergencyEvent.EventType.FIRE).severity(EmergencyEvent.SeverityLevel.MEDIUM)
                .title("云龙校区机电学院配电房冒烟").description("机电学院教学楼地下配电房发现冒烟，已紧急断电并报警。")
                .lng(110.4578).lat(19.8603).locationDesc("机电工程学院教学楼地下配电房")
                .reporterId(2L).campusId(cid2)
                .status(EmergencyEvent.EventStatus.RESOLVED).casualties(0)
                .occurredAt(LocalDateTime.now().minusDays(10).withHour(9).withMinute(20))
                .resolvedAt(LocalDateTime.now().minusDays(10).withHour(10).withMinute(0))
                .build());
        emergencyEventRepository.save(EmergencyEvent.builder()
                .type(EmergencyEvent.EventType.MEDICAL).severity(EmergencyEvent.SeverityLevel.LOW)
                .title("云龙校区食堂疑似食物中毒").description("多名学生反映饭后腹痛，已通知校医务室及附近医院。")
                .lng(110.4583).lat(19.8593).locationDesc("云龙校区食堂")
                .reporterId(3L).campusId(cid2)
                .status(EmergencyEvent.EventStatus.IN_PROGRESS).casualties(3)
                .occurredAt(LocalDateTime.now().minusHours(4))
                .build());

        // 云龙校区演练
        drillPlanRepository.save(DrillPlan.builder()
                .name("云龙校区秋季消防演练")
                .scenarioType(DrillPlan.ScenarioType.FIRE).campusId(cid2)
                .description("云龙校区全体师生参与的秋季消防疏散演练。")
                .participantCount(800)
                .centerLng(110.4573).centerLat(19.8598).radius(600.0)
                .scheduledAt(LocalDateTime.now().plusDays(14).withHour(10).withMinute(0))
                .status(DrillPlan.DrillStatus.PLANNED)
                .build());

        // 补充更多用户
        userRepository.save(User.builder().username("security02").password(passwordEncoder.encode("123456"))
                .realName("李安全").phone("13800000005").role(User.UserRole.SECURITY).campusId(cid).department("保卫处").enabled(true).build());
        userRepository.save(User.builder().username("student02").password(passwordEncoder.encode("123456"))
                .realName("赵同学").phone("13800000006").role(User.UserRole.STUDENT).campusId(cid).department("财经学院").enabled(true).build());
        userRepository.save(User.builder().username("teacher02").password(passwordEncoder.encode("123456"))
                .realName("陈教授").phone("13800000007").role(User.UserRole.TEACHER).campusId(cid).department("药学院").enabled(true).build());
        userRepository.save(User.builder().username("security03").password(passwordEncoder.encode("123456"))
                .realName("周安全").phone("13800000008").role(User.UserRole.SECURITY).campusId(cid2).department("云龙校区保卫科").enabled(true).build());
        userRepository.save(User.builder().username("student03").password(passwordEncoder.encode("123456"))
                .realName("吴同学").phone("13800000009").role(User.UserRole.STUDENT).campusId(cid2).department("机电工程学院").enabled(true).build());

        log.info("演示数据初始化完成（海南科技职业大学）：2校区(美兰/云龙), 9用户, {}建筑, 14点位, 11疏散路线, 8事件, 3告警, 6演练, 4巡检, 3隐患, 3预案, 4物资, 3排班, 3通知, 4课程, 10系统配置", blds.length + 5);
    }
}
