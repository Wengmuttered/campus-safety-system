package com.campussafety.controller;

import com.campussafety.entity.SystemConfig;
import com.campussafety.repository.SystemConfigRepository;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 系统设置管理
 */
@RestController
@RequestMapping("/api/system")
@RequiredArgsConstructor
public class SystemConfigController {

    private final SystemConfigRepository configRepo;

    // 获取所有配置项
    @GetMapping("/configs")
    public ApiResponse<List<SystemConfig>> getAllConfigs() {
        return ApiResponse.success(configRepo.findAll());
    }

    // 按分类获取
    @GetMapping("/configs/category/{category}")
    public ApiResponse<List<SystemConfig>> getByCategory(@PathVariable String category) {
        return ApiResponse.success(configRepo.findByCategoryOrderByConfigKeyAsc(category));
    }

    // 获取单项
    @GetMapping("/configs/key/{key}")
    public ApiResponse<SystemConfig> getByKey(@PathVariable String key) {
        return configRepo.findByConfigKey(key)
                .map(ApiResponse::success)
                .orElse(ApiResponse.error("配置项不存在: " + key));
    }

    // 更新或创建配置项
    @PutMapping("/configs")
    public ApiResponse<SystemConfig> updateConfig(@RequestBody Map<String, String> body) {
        String key = body.get("configKey");
        String value = body.get("configValue");
        String category = body.get("category");
        String desc = body.get("description");

        SystemConfig config = configRepo.findByConfigKey(key).orElse(
                SystemConfig.builder().configKey(key).build()
        );
        config.setConfigValue(value);
        if (category != null) config.setCategory(category);
        if (desc != null) config.setDescription(desc);
        return ApiResponse.success("配置已更新", configRepo.save(config));
    }

    // 批量更新
    @PutMapping("/configs/batch")
    public ApiResponse<Void> batchUpdate(@RequestBody List<Map<String, String>> items) {
        for (Map<String, String> item : items) {
            String key = item.get("configKey");
            String value = item.get("configValue");
            SystemConfig config = configRepo.findByConfigKey(key).orElse(
                    SystemConfig.builder().configKey(key).category(item.get("category")).description(item.get("description")).build()
            );
            config.setConfigValue(value);
            configRepo.save(config);
        }
        return ApiResponse.success("批量更新成功", null);
    }

    // 删除配置项
    @DeleteMapping("/configs/{id}")
    public ApiResponse<Void> deleteConfig(@PathVariable Long id) {
        configRepo.deleteById(id);
        return ApiResponse.success("配置已删除", null);
    }
}
