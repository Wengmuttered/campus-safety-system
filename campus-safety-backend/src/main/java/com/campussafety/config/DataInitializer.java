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

    @Override
    public void run(String... args) {
        if (userRepository.count() > 0) {
            log.info("数据库已有数据，跳过初始化");
            return;
        }
        log.info("开始初始化演示数据...");

        Campus campus = campusRepository.save(Campus.builder()
                .name("海南大学海甸校区").address("海南省海口市美兰区人民大道58号")
                .centerLng(110.3308).centerLat(20.0588).defaultAltitude(1500.0).build());
        Long cid = campus.getId();

        // 用户
        userRepository.save(User.builder().username("admin").password(passwordEncoder.encode("admin123"))
                .realName("系统管理员").phone("13800000001").role(User.UserRole.ADMIN).campusId(cid).enabled(true).build());
        userRepository.save(User.builder().username("security01").password(passwordEncoder.encode("123456"))
                .realName("张安全").phone("13800000002").role(User.UserRole.SECURITY).campusId(cid).department("保卫处").enabled(true).build());
        userRepository.save(User.builder().username("student01").password(passwordEncoder.encode("123456"))
                .realName("李同学").phone("13800000003").role(User.UserRole.STUDENT).campusId(cid).department("计算机与网络空间安全学院").enabled(true).build());
        userRepository.save(User.builder().username("teacher01").password(passwordEncoder.encode("123456"))
                .realName("王老师").phone("13800000004").role(User.UserRole.TEACHER).campusId(cid).department("化学工程学院").enabled(true).build());

        // 建筑物
        Building[] blds = {
            buildingRepository.save(Building.builder().name("理工楼").campusId(cid).lng(110.3310).lat(20.0590).height(30.0).floorCount(6).buildingType("教学楼").capacity(2000).build()),
            buildingRepository.save(Building.builder().name("图书馆").campusId(cid).lng(110.3295).lat(20.0585).height(25.0).floorCount(5).buildingType("图书馆").capacity(3000).build()),
            buildingRepository.save(Building.builder().name("学生食堂").campusId(cid).lng(110.3320).lat(20.0575).height(12.0).floorCount(3).buildingType("食堂").capacity(1500).build()),
            buildingRepository.save(Building.builder().name("体育馆").campusId(cid).lng(110.3280).lat(20.0600).height(20.0).floorCount(2).buildingType("体育场馆").capacity(5000).build()),
            buildingRepository.save(Building.builder().name("学生宿舍1栋").campusId(cid).lng(110.3335).lat(20.0570).height(35.0).floorCount(7).buildingType("宿舍").capacity(500).build()),
            buildingRepository.save(Building.builder().name("行政楼").campusId(cid).lng(110.3300).lat(20.0595).height(18.0).floorCount(4).buildingType("办公楼").capacity(300).build())
        };

        // 安全点位
        safetyPointRepository.save(SafetyPoint.builder().name("理工楼1楼消防栓").type(SafetyPoint.PointType.FIRE_HYDRANT).lng(110.3311).lat(20.0591).floor(1).buildingId(blds[0].getId()).campusId(cid).status(SafetyPoint.PointStatus.NORMAL).build());
        safetyPointRepository.save(SafetyPoint.builder().name("图书馆AED").type(SafetyPoint.PointType.AED).lng(110.3296).lat(20.0586).floor(1).buildingId(blds[1].getId()).campusId(cid).status(SafetyPoint.PointStatus.NORMAL).build());
        safetyPointRepository.save(SafetyPoint.builder().name("操场集合点").type(SafetyPoint.PointType.ASSEMBLY_POINT).lng(110.3282).lat(20.0602).floor(0).campusId(cid).status(SafetyPoint.PointStatus.NORMAL).description("地震应急集合点").build());
        safetyPointRepository.save(SafetyPoint.builder().name("东门安全出口").type(SafetyPoint.PointType.EXIT).lng(110.3340).lat(20.0588).floor(0).campusId(cid).status(SafetyPoint.PointStatus.NORMAL).build());
        safetyPointRepository.save(SafetyPoint.builder().name("食堂灭火器").type(SafetyPoint.PointType.FIRE_EXTINGUISHER).lng(110.3321).lat(20.0576).floor(1).buildingId(blds[2].getId()).campusId(cid).status(SafetyPoint.PointStatus.NORMAL).build());
        safetyPointRepository.save(SafetyPoint.builder().name("宿舍区急救箱").type(SafetyPoint.PointType.FIRST_AID).lng(110.3336).lat(20.0571).floor(1).buildingId(blds[4].getId()).campusId(cid).status(SafetyPoint.PointStatus.NORMAL).build());
        safetyPointRepository.save(SafetyPoint.builder().name("行政楼监控").type(SafetyPoint.PointType.CAMERA).lng(110.3301).lat(20.0596).floor(0).buildingId(blds[5].getId()).campusId(cid).status(SafetyPoint.PointStatus.NORMAL).build());
        safetyPointRepository.save(SafetyPoint.builder().name("图书馆报警按钮").type(SafetyPoint.PointType.ALARM_BUTTON).lng(110.3294).lat(20.0584).floor(1).buildingId(blds[1].getId()).campusId(cid).status(SafetyPoint.PointStatus.NORMAL).build());

        // 疏散路线
        evacuationRouteRepository.save(EvacuationRoute.builder().name("理工楼北侧楼梯疏散路线").buildingId(blds[0].getId()).campusId(cid).startFloor(6).distance(120.0).estimatedTime(90).capacity(200).accessible(false).description("从6楼北侧楼梯依次下行至1楼北门出口").build());
        evacuationRouteRepository.save(EvacuationRoute.builder().name("理工楼南侧无障碍路线").buildingId(blds[0].getId()).campusId(cid).startFloor(6).distance(150.0).estimatedTime(120).capacity(150).accessible(true).description("从6楼经南侧无障碍电梯至1楼").build());
        evacuationRouteRepository.save(EvacuationRoute.builder().name("图书馆中央楼梯疏散路线").buildingId(blds[1].getId()).campusId(cid).startFloor(5).distance(100.0).estimatedTime(80).capacity(300).accessible(false).description("从5楼中央楼梯下行经正门疏散至前广场").build());
        evacuationRouteRepository.save(EvacuationRoute.builder().name("图书馆消防通道路线").buildingId(blds[1].getId()).campusId(cid).startFloor(5).distance(90.0).estimatedTime(70).capacity(200).accessible(false).description("从5楼西侧消防通道下行").build());
        evacuationRouteRepository.save(EvacuationRoute.builder().name("食堂主出口疏散路线").buildingId(blds[2].getId()).campusId(cid).startFloor(3).distance(60.0).estimatedTime(45).capacity(500).accessible(true).description("从3楼经主楼梯下行").build());
        evacuationRouteRepository.save(EvacuationRoute.builder().name("体育馆四向疏散路线").buildingId(blds[3].getId()).campusId(cid).startFloor(2).distance(80.0).estimatedTime(60).capacity(1000).accessible(true).description("四个安全出口同时疏散").build());
        evacuationRouteRepository.save(EvacuationRoute.builder().name("宿舍楼梯疏散路线").buildingId(blds[4].getId()).campusId(cid).startFloor(7).distance(140.0).estimatedTime(100).capacity(250).accessible(false).description("从7楼经两侧楼梯下行").build());
        evacuationRouteRepository.save(EvacuationRoute.builder().name("行政楼疏散路线").buildingId(blds[5].getId()).campusId(cid).startFloor(4).distance(70.0).estimatedTime(50).capacity(150).accessible(true).description("从4楼经无障碍电梯下行").build());

        // 巡检任务
        inspectionTaskRepository.save(InspectionTask.builder().title("理工楼消防设施月度巡检").type(InspectionTask.InspectionType.FIRE).assigneeId(2L).campusId(cid).createdBy(1L).area("理工楼1-6层").scheduledAt(LocalDateTime.now().plusDays(1)).status(InspectionTask.InspectionStatus.PENDING).build());
        inspectionTaskRepository.save(InspectionTask.builder().title("学生食堂食品安全巡检").type(InspectionTask.InspectionType.FOOD).assigneeId(2L).campusId(cid).createdBy(1L).area("学生食堂1-3层").scheduledAt(LocalDateTime.now().plusDays(2)).status(InspectionTask.InspectionStatus.PENDING).build());
        inspectionTaskRepository.save(InspectionTask.builder().title("宿舍区电气安全检查").type(InspectionTask.InspectionType.ELECTRICAL).assigneeId(2L).campusId(cid).createdBy(1L).area("学生宿舍1-3栋").scheduledAt(LocalDateTime.now().minusDays(1)).status(InspectionTask.InspectionStatus.COMPLETED).result(InspectionTask.InspectionResult.ABNORMAL).issueCount(3).completedAt(LocalDateTime.now().minusHours(6)).remark("发现3处违规使用大功率电器").build());
        inspectionTaskRepository.save(InspectionTask.builder().title("实验室安全综合巡检").type(InspectionTask.InspectionType.LABORATORY).assigneeId(2L).campusId(cid).createdBy(1L).area("化工实验楼").scheduledAt(LocalDateTime.now()).status(InspectionTask.InspectionStatus.IN_PROGRESS).startedAt(LocalDateTime.now().minusHours(1)).build());

        // 隐患报告
        hazardReportRepository.save(HazardReport.builder().title("理工楼3楼走廊灭火器过期").type(HazardReport.HazardType.FIRE).level(HazardReport.HazardLevel.MINOR).description("3楼东侧走廊2个灭火器已超过有效期").locationDesc("理工楼3楼东侧走廊").lng(110.3312).lat(20.0591).reporterId(2L).campusId(cid).status(HazardReport.HazardStatus.RECTIFYING).deadline(LocalDateTime.now().plusDays(7)).build());
        hazardReportRepository.save(HazardReport.builder().title("食堂后厨排烟系统故障").type(HazardReport.HazardType.FIRE).level(HazardReport.HazardLevel.MAJOR).description("食堂2楼后厨排烟系统工作异常").locationDesc("食堂2楼后厨").lng(110.3321).lat(20.0576).reporterId(2L).campusId(cid).status(HazardReport.HazardStatus.CONFIRMED).deadline(LocalDateTime.now().plusDays(3)).build());
        hazardReportRepository.save(HazardReport.builder().title("宿舍区路灯损坏").type(HazardReport.HazardType.ELECTRICAL).level(HazardReport.HazardLevel.MINOR).description("宿舍区北侧3盏路灯损坏").locationDesc("宿舍区北侧道路").lng(110.3335).lat(20.0572).reporterId(3L).campusId(cid).status(HazardReport.HazardStatus.REPORTED).build());

        // 应急预案
        emergencyPlanRepository.save(EmergencyPlan.builder().title("校园火灾应急预案").type(EmergencyPlan.PlanType.FIRE).level(EmergencyPlan.PlanLevel.SCHOOL).version("2.1").content("适用于校园内各类火灾事故的应急处置").campusId(cid).createdBy(1L).status(EmergencyPlan.PlanStatus.PUBLISHED).publishedAt(LocalDateTime.now().minusDays(30)).build());
        emergencyPlanRepository.save(EmergencyPlan.builder().title("地震应急疏散预案").type(EmergencyPlan.PlanType.EARTHQUAKE).level(EmergencyPlan.PlanLevel.SCHOOL).version("1.0").content("适用于校园区域内发生地震时的紧急疏散和避险").campusId(cid).createdBy(1L).status(EmergencyPlan.PlanStatus.PUBLISHED).publishedAt(LocalDateTime.now().minusDays(60)).build());
        emergencyPlanRepository.save(EmergencyPlan.builder().title("化学品泄漏事故预案").type(EmergencyPlan.PlanType.CHEMICAL).level(EmergencyPlan.PlanLevel.COLLEGE).version("1.0").content("适用于化工实验楼内化学品泄漏事故的应急处置").campusId(cid).createdBy(1L).status(EmergencyPlan.PlanStatus.DRAFT).build());

        // 应急物资
        emergencySupplyRepository.save(EmergencySupply.builder().name("ABC干粉灭火器").category(EmergencySupply.SupplyCategory.FIRE_EQUIPMENT).model("MFZ/ABC4").quantity(120).unit("个").warehouseLocation("消防器材库A区").campusId(cid).expiryDate(LocalDate.now().plusYears(1)).status(EmergencySupply.SupplyStatus.NORMAL).manager("张安全").minStock(20).build());
        emergencySupplyRepository.save(EmergencySupply.builder().name("急救药箱").category(EmergencySupply.SupplyCategory.MEDICAL).model("标准型").quantity(30).unit("套").warehouseLocation("医务室仓库").campusId(cid).expiryDate(LocalDate.now().plusMonths(6)).status(EmergencySupply.SupplyStatus.NORMAL).manager("李医生").minStock(10).build());
        emergencySupplyRepository.save(EmergencySupply.builder().name("防毒面具").category(EmergencySupply.SupplyCategory.PROTECTION).model("3M 6200").quantity(6).unit("个").warehouseLocation("化工实验楼B102").campusId(cid).expiryDate(LocalDate.now().plusMonths(3)).status(EmergencySupply.SupplyStatus.LOW_STOCK).manager("王老师").minStock(10).build());
        emergencySupplyRepository.save(EmergencySupply.builder().name("应急对讲机").category(EmergencySupply.SupplyCategory.COMMUNICATION).model("Motorola T82").quantity(12).unit("台").warehouseLocation("保卫处办公室").campusId(cid).status(EmergencySupply.SupplyStatus.NORMAL).manager("张安全").minStock(5).build());

        // 值班排班
        LocalDate today = LocalDate.now();
        dutyScheduleRepository.save(DutySchedule.builder().userId(2L).campusId(cid).dutyDate(today).shiftType(DutySchedule.ShiftType.DAY).area("校园南区").startTime(LocalTime.of(8,0)).endTime(LocalTime.of(18,0)).status(DutySchedule.DutyStatus.ON_DUTY).build());
        dutyScheduleRepository.save(DutySchedule.builder().userId(2L).campusId(cid).dutyDate(today).shiftType(DutySchedule.ShiftType.NIGHT).area("校园北区").startTime(LocalTime.of(18,0)).endTime(LocalTime.of(8,0)).status(DutySchedule.DutyStatus.SCHEDULED).build());
        dutyScheduleRepository.save(DutySchedule.builder().userId(2L).campusId(cid).dutyDate(today.plusDays(1)).shiftType(DutySchedule.ShiftType.DAY).area("校园东区").startTime(LocalTime.of(8,0)).endTime(LocalTime.of(18,0)).status(DutySchedule.DutyStatus.SCHEDULED).build());

        // 通知公告
        noticeRepository.save(Notice.builder().title("关于开展春季校园安全大检查的通知").content("根据学校安全工作部署，定于本月15日至30日开展春季校园安全大检查活动。").type(Notice.NoticeType.NOTICE).priority(Notice.NoticePriority.IMPORTANT).publisherId(1L).campusId(cid).isTop(true).status(Notice.NoticeStatus.PUBLISHED).publishedAt(LocalDateTime.now().minusDays(2)).build());
        noticeRepository.save(Notice.builder().title("暴雨预警：请注意防范").content("气象部门发布暴雨橙色预警，请各单位做好防汛准备。").type(Notice.NoticeType.ALERT).priority(Notice.NoticePriority.URGENT).publisherId(1L).campusId(cid).isTop(true).status(Notice.NoticeStatus.PUBLISHED).publishedAt(LocalDateTime.now().minusHours(3)).build());
        noticeRepository.save(Notice.builder().title("消防安全培训报名通知").content("保卫处将于下周三举办消防安全培训课程，欢迎师生报名参加。").type(Notice.NoticeType.TRAINING).priority(Notice.NoticePriority.NORMAL).publisherId(1L).campusId(cid).isTop(false).status(Notice.NoticeStatus.PUBLISHED).publishedAt(LocalDateTime.now().minusDays(5)).build());

        // 培训课程
        trainingCourseRepository.save(TrainingCourse.builder().title("消防安全知识与灭火器使用").type(TrainingCourse.CourseType.FIRE).content("火灾成因与分类、灭火器使用方法、初起火灾扑救、火场逃生自救技巧").duration(45).mandatory(true).campusId(cid).createdBy(1L).status(TrainingCourse.CourseStatus.PUBLISHED).publishedAt(LocalDateTime.now().minusDays(15)).build());
        trainingCourseRepository.save(TrainingCourse.builder().title("地震避险与紧急疏散").type(TrainingCourse.CourseType.DISASTER).content("地震基本知识、室内避险姿势、有序疏散流程、震后自救互救").duration(30).mandatory(true).campusId(cid).createdBy(1L).status(TrainingCourse.CourseStatus.PUBLISHED).publishedAt(LocalDateTime.now().minusDays(20)).build());
        trainingCourseRepository.save(TrainingCourse.builder().title("急救技能-心肺复苏CPR").type(TrainingCourse.CourseType.FIRST_AID).content("心肺复苏原理、CPR操作步骤、AED使用方法").duration(60).mandatory(false).campusId(cid).createdBy(1L).status(TrainingCourse.CourseStatus.PUBLISHED).publishedAt(LocalDateTime.now().minusDays(10)).build());
        trainingCourseRepository.save(TrainingCourse.builder().title("实验室安全操作规范").type(TrainingCourse.CourseType.LAB_SAFETY).content("化学品分类与标识、个人防护装备使用、废弃物处理规范").duration(40).mandatory(true).campusId(cid).createdBy(1L).status(TrainingCourse.CourseStatus.DRAFT).build());

        // 系统默认配置
        systemConfigRepository.save(SystemConfig.builder().configKey("system.name").configValue("高校应急安全管理系统").category("SYSTEM").description("系统名称").build());
        systemConfigRepository.save(SystemConfig.builder().configKey("system.version").configValue("2.0.0").category("SYSTEM").description("系统版本").build());
        systemConfigRepository.save(SystemConfig.builder().configKey("system.contact").configValue("保卫处 0898-66666666").category("SYSTEM").description("紧急联系方式").build());
        systemConfigRepository.save(SystemConfig.builder().configKey("safety.inspection.interval").configValue("30").category("SAFETY").description("巡检间隔天数").build());
        systemConfigRepository.save(SystemConfig.builder().configKey("safety.hazard.deadline").configValue("7").category("SAFETY").description("隐患整改默认期限(天)").build());
        systemConfigRepository.save(SystemConfig.builder().configKey("safety.supply.alert.threshold").configValue("10").category("SAFETY").description("物资库存预警阈值").build());
        systemConfigRepository.save(SystemConfig.builder().configKey("notification.email.enabled").configValue("false").category("NOTIFICATION").description("邮件通知开关").build());
        systemConfigRepository.save(SystemConfig.builder().configKey("notification.sms.enabled").configValue("false").category("NOTIFICATION").description("短信通知开关").build());
        systemConfigRepository.save(SystemConfig.builder().configKey("upload.max.size").configValue("10").category("UPLOAD").description("最大上传文件大小(MB)").build());
        systemConfigRepository.save(SystemConfig.builder().configKey("upload.allowed.types").configValue("jpg,png,pdf,doc,docx,xls,xlsx").category("UPLOAD").description("允许的文件类型").build());

        log.info("演示数据初始化完成：1校区, 4用户, {}建筑, 8点位, 8疏散路线, 4巡检, 3隐患, 3预案, 4物资, 3排班, 3通知, 4课程, 10系统配置", blds.length);
    }
}
