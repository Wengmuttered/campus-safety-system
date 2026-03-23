package com.campussafety.config;

import com.campussafety.entity.*;
import com.campussafety.repository.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
@Slf4j
public class DataInitializer implements CommandLineRunner {

    private final UserRepository userRepository;
    private final CampusRepository campusRepository;
    private final BuildingRepository buildingRepository;
    private final SafetyPointRepository safetyPointRepository;
    private final PasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) {
        if (userRepository.count() > 0) {
            log.info("数据库已有数据，跳过初始化");
            return;
        }

        log.info("开始初始化演示数据...");

        // 1. 创建校区（以海南大学为示例）
        Campus campus = campusRepository.save(Campus.builder()
                .name("海南大学海甸校区")
                .address("海南省海口市美兰区人民大道58号")
                .centerLng(110.3308)
                .centerLat(20.0588)
                .defaultAltitude(1500.0)
                .build());

        // 2. 创建管理员用户
        userRepository.save(User.builder()
                .username("admin")
                .password(passwordEncoder.encode("admin123"))
                .realName("系统管理员")
                .phone("13800000001")
                .role(User.UserRole.ADMIN)
                .campusId(campus.getId())
                .enabled(true)
                .build());

        // 3. 创建安保人员
        userRepository.save(User.builder()
                .username("security01")
                .password(passwordEncoder.encode("123456"))
                .realName("张安全")
                .phone("13800000002")
                .role(User.UserRole.SECURITY)
                .campusId(campus.getId())
                .department("保卫处")
                .enabled(true)
                .build());

        // 4. 创建学生用户
        userRepository.save(User.builder()
                .username("student01")
                .password(passwordEncoder.encode("123456"))
                .realName("李同学")
                .phone("13800000003")
                .role(User.UserRole.STUDENT)
                .campusId(campus.getId())
                .department("计算机与网络空间安全学院")
                .enabled(true)
                .build());

        // 5. 创建建筑物
        Building[] buildings = {
            buildingRepository.save(Building.builder()
                .name("理工楼")
                .campusId(campus.getId())
                .lng(110.3310).lat(20.0590)
                .height(30.0).floorCount(6)
                .buildingType("教学楼").capacity(2000)
                .build()),
            buildingRepository.save(Building.builder()
                .name("图书馆")
                .campusId(campus.getId())
                .lng(110.3295).lat(20.0585)
                .height(25.0).floorCount(5)
                .buildingType("图书馆").capacity(3000)
                .build()),
            buildingRepository.save(Building.builder()
                .name("学生食堂")
                .campusId(campus.getId())
                .lng(110.3320).lat(20.0575)
                .height(12.0).floorCount(3)
                .buildingType("食堂").capacity(1500)
                .build()),
            buildingRepository.save(Building.builder()
                .name("体育馆")
                .campusId(campus.getId())
                .lng(110.3280).lat(20.0600)
                .height(20.0).floorCount(2)
                .buildingType("体育场馆").capacity(5000)
                .build()),
            buildingRepository.save(Building.builder()
                .name("学生宿舍1栋")
                .campusId(campus.getId())
                .lng(110.3335).lat(20.0570)
                .height(35.0).floorCount(7)
                .buildingType("宿舍").capacity(500)
                .build()),
            buildingRepository.save(Building.builder()
                .name("行政楼")
                .campusId(campus.getId())
                .lng(110.3300).lat(20.0595)
                .height(18.0).floorCount(4)
                .buildingType("办公楼").capacity(300)
                .build())
        };

        // 6. 创建安全点位
        safetyPointRepository.save(SafetyPoint.builder()
                .name("理工楼1楼消防栓").type(SafetyPoint.PointType.FIRE_HYDRANT)
                .lng(110.3311).lat(20.0591).floor(1)
                .buildingId(buildings[0].getId()).campusId(campus.getId())
                .status(SafetyPoint.PointStatus.NORMAL).build());

        safetyPointRepository.save(SafetyPoint.builder()
                .name("图书馆AED").type(SafetyPoint.PointType.AED)
                .lng(110.3296).lat(20.0586).floor(1)
                .buildingId(buildings[1].getId()).campusId(campus.getId())
                .status(SafetyPoint.PointStatus.NORMAL).build());

        safetyPointRepository.save(SafetyPoint.builder()
                .name("操场集合点").type(SafetyPoint.PointType.ASSEMBLY_POINT)
                .lng(110.3282).lat(20.0602).floor(0)
                .campusId(campus.getId())
                .status(SafetyPoint.PointStatus.NORMAL)
                .description("地震应急集合点").build());

        safetyPointRepository.save(SafetyPoint.builder()
                .name("东门安全出口").type(SafetyPoint.PointType.EXIT)
                .lng(110.3340).lat(20.0588).floor(0)
                .campusId(campus.getId())
                .status(SafetyPoint.PointStatus.NORMAL).build());

        safetyPointRepository.save(SafetyPoint.builder()
                .name("食堂灭火器").type(SafetyPoint.PointType.FIRE_EXTINGUISHER)
                .lng(110.3321).lat(20.0576).floor(1)
                .buildingId(buildings[2].getId()).campusId(campus.getId())
                .status(SafetyPoint.PointStatus.NORMAL).build());

        safetyPointRepository.save(SafetyPoint.builder()
                .name("宿舍区急救箱").type(SafetyPoint.PointType.FIRST_AID)
                .lng(110.3336).lat(20.0571).floor(1)
                .buildingId(buildings[4].getId()).campusId(campus.getId())
                .status(SafetyPoint.PointStatus.NORMAL).build());

        safetyPointRepository.save(SafetyPoint.builder()
                .name("行政楼监控").type(SafetyPoint.PointType.CAMERA)
                .lng(110.3301).lat(20.0596).floor(0)
                .buildingId(buildings[5].getId()).campusId(campus.getId())
                .status(SafetyPoint.PointStatus.NORMAL).build());

        safetyPointRepository.save(SafetyPoint.builder()
                .name("图书馆报警按钮").type(SafetyPoint.PointType.ALARM_BUTTON)
                .lng(110.3294).lat(20.0584).floor(1)
                .buildingId(buildings[1].getId()).campusId(campus.getId())
                .status(SafetyPoint.PointStatus.NORMAL).build());

        log.info("演示数据初始化完成：1个校区, 3个用户, {}个建筑, 8个安全点位", buildings.length);
    }
}
