package com.campussafety.config;

import com.campussafety.entity.MapLayerDefinition;
import com.campussafety.repository.MapLayerDefinitionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * 预置国内在线底图顺序：天地图矢量(底) → 天地图影像 → 高德卫星(顶，半透明可调)
 */
@Component
@Order(50)
@RequiredArgsConstructor
public class MapLayerDataInitializer implements CommandLineRunner {

    private final MapLayerDefinitionRepository repository;

    @Override
    public void run(String... args) {
        if (repository.count() > 0) {
            return;
        }
        repository.save(MapLayerDefinition.builder()
                .layerKey("tianditu-vec")
                .name("天地图 矢量")
                .urlTemplate("https://t{s}.tianditu.gov.cn/DataServer?T=vec_w&x={x}&y={y}&l={z}&tk=__TK__")
                .subdomains("0,1,2,3,4,5,6,7")
                .minZoom(1).maxZoom(18).zOrder(10)
                .defaultVisible(true).defaultOpacity(1.0).enabled(true)
                .credit("国家基础地理信息公共服务平台 天地图")
                .visible(true).opacity(1.0)
                .build());
        repository.save(MapLayerDefinition.builder()
                .layerKey("tianditu-img")
                .name("天地图 影像")
                .urlTemplate("https://t{s}.tianditu.gov.cn/DataServer?T=img_w&x={x}&y={y}&l={z}&tk=__TK__")
                .subdomains("0,1,2,3,4,5,6,7")
                .minZoom(1).maxZoom(18).zOrder(20)
                .defaultVisible(false).defaultOpacity(0.75).enabled(true)
                .credit("国家基础地理信息公共服务平台 天地图")
                .visible(false).opacity(0.75)
                .build());
        repository.save(MapLayerDefinition.builder()
                .layerKey("gaode-satellite")
                .name("高德 卫星影像")
                .urlTemplate("https://webst0{s}.is.autonavi.com/appmaptile?style=6&x={x}&y={y}&z={z}")
                .subdomains("1,2,3,4")
                .minZoom(1).maxZoom(18).zOrder(30)
                .defaultVisible(true).defaultOpacity(0.88).enabled(true)
                .credit("© 高德地图")
                .visible(true).opacity(0.88)
                .build());
    }
}
