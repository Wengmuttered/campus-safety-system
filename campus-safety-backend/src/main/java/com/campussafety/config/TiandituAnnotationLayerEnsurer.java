package com.campussafety.config;

import com.campussafety.entity.MapLayerDefinition;
import com.campussafety.repository.MapLayerDefinitionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * 影像/卫星栅格底图本身不含道路与 POI 注记；叠 {@code cva_w} 后可在最上层显示地名与路网标注。
 */
@Component
@Order(51)
@RequiredArgsConstructor
public class TiandituAnnotationLayerEnsurer implements CommandLineRunner {

    private final MapLayerDefinitionRepository repository;

    @Override
    public void run(String... args) {
        if (repository.findByLayerKey("tianditu-cva").isPresent()) {
            return;
        }
        repository.save(MapLayerDefinition.builder()
                .layerKey("tianditu-cva")
                .name("天地图 注记(路网地名)")
                .urlTemplate("https://t{s}.tianditu.gov.cn/DataServer?T=cva_w&x={x}&y={y}&l={z}&tk=__TK__")
                .subdomains("0,1,2,3,4,5,6,7")
                .minZoom(1).maxZoom(18).zOrder(40)
                .defaultVisible(true).defaultOpacity(0.92).enabled(true)
                .credit("国家基础地理信息公共服务平台 天地图")
                .visible(true).opacity(0.92)
                .build());
    }
}
