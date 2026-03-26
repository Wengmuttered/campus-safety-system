package com.campussafety.controller;

import com.campussafety.entity.EmergencySupply;
import com.campussafety.entity.SupplyRecord;
import com.campussafety.repository.EmergencySupplyRepository;
import com.campussafety.repository.SupplyRecordRepository;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/supplies")
@RequiredArgsConstructor
public class SupplyController {

    private final EmergencySupplyRepository supplyRepository;
    private final SupplyRecordRepository recordRepository;

    @GetMapping
    public ApiResponse<Page<EmergencySupply>> getSupplies(
            @RequestParam Long campusId,
            @RequestParam(required = false) EmergencySupply.SupplyCategory category,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        if (category != null) {
            return ApiResponse.success(supplyRepository.findByCampusIdAndCategoryOrderByCreatedAtDesc(campusId, category, PageRequest.of(page, size)));
        }
        return ApiResponse.success(supplyRepository.findByCampusIdOrderByCreatedAtDesc(campusId, PageRequest.of(page, size)));
    }

    @PostMapping
    public ApiResponse<EmergencySupply> create(@RequestBody EmergencySupply supply) {
        return ApiResponse.success("物资已录入", supplyRepository.save(supply));
    }

    @PutMapping("/{id}")
    public ApiResponse<EmergencySupply> update(@PathVariable Long id, @RequestBody EmergencySupply supply) {
        EmergencySupply existing = supplyRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("物资不存在"));
        if (supply.getName() != null) existing.setName(supply.getName());
        if (supply.getCategory() != null) existing.setCategory(supply.getCategory());
        if (supply.getModel() != null) existing.setModel(supply.getModel());
        if (supply.getQuantity() != null) existing.setQuantity(supply.getQuantity());
        if (supply.getWarehouseLocation() != null) existing.setWarehouseLocation(supply.getWarehouseLocation());
        if (supply.getExpiryDate() != null) existing.setExpiryDate(supply.getExpiryDate());
        if (supply.getManager() != null) existing.setManager(supply.getManager());
        if (supply.getMinStock() != null) existing.setMinStock(supply.getMinStock());
        return ApiResponse.success("更新成功", supplyRepository.save(existing));
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> delete(@PathVariable Long id) {
        supplyRepository.deleteById(id);
        return ApiResponse.success("已删除", null);
    }

    // 出入库操作
    @PostMapping("/{id}/record")
    public ApiResponse<SupplyRecord> addRecord(@PathVariable Long id, @RequestBody SupplyRecord record) {
        EmergencySupply supply = supplyRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("物资不存在"));

        record.setSupplyId(id);
        SupplyRecord saved = recordRepository.save(record);

        // 更新物资库存
        if (record.getType() == SupplyRecord.RecordType.IN) {
            supply.setQuantity(supply.getQuantity() + record.getQuantity());
        } else if (record.getType() == SupplyRecord.RecordType.OUT) {
            supply.setQuantity(Math.max(0, supply.getQuantity() - record.getQuantity()));
        }

        // 检查库存预警
        if (supply.getMinStock() != null && supply.getQuantity() <= supply.getMinStock()) {
            supply.setStatus(EmergencySupply.SupplyStatus.LOW_STOCK);
        } else {
            supply.setStatus(EmergencySupply.SupplyStatus.NORMAL);
        }
        supplyRepository.save(supply);

        return ApiResponse.success("操作成功", saved);
    }

    @GetMapping("/{id}/records")
    public ApiResponse<List<SupplyRecord>> getRecords(@PathVariable Long id) {
        return ApiResponse.success(recordRepository.findBySupplyIdOrderByCreatedAtDesc(id));
    }

    // 库存预警列表
    @GetMapping("/warnings")
    public ApiResponse<Map<String, Object>> getWarnings(@RequestParam Long campusId) {
        List<EmergencySupply> lowStock = supplyRepository.findByCampusIdAndStatus(campusId, EmergencySupply.SupplyStatus.LOW_STOCK);
        List<EmergencySupply> expired = supplyRepository.findByExpiryDateBefore(LocalDate.now());
        List<EmergencySupply> damaged = supplyRepository.findByCampusIdAndStatus(campusId, EmergencySupply.SupplyStatus.DAMAGED);
        return ApiResponse.success(Map.of(
                "lowStock", lowStock,
                "expired", expired,
                "damaged", damaged
        ));
    }
}
