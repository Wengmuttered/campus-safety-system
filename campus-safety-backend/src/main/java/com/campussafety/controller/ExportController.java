package com.campussafety.controller;

import com.campussafety.service.ExportService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * 报表导出接口
 */
@RestController
@RequestMapping("/api/export")
@RequiredArgsConstructor
public class ExportController {

    private final ExportService exportService;

    @GetMapping("/inspections")
    public void exportInspections(
            @RequestParam(defaultValue = "1") Long campusId,
            HttpServletResponse response) throws Exception {
        exportService.exportInspections(campusId, response);
    }

    @GetMapping("/hazards")
    public void exportHazards(
            @RequestParam(defaultValue = "1") Long campusId,
            HttpServletResponse response) throws Exception {
        exportService.exportHazards(campusId, response);
    }

    @GetMapping("/supplies")
    public void exportSupplies(
            @RequestParam(defaultValue = "1") Long campusId,
            HttpServletResponse response) throws Exception {
        exportService.exportSupplies(campusId, response);
    }

    @GetMapping("/logs")
    public void exportLogs(HttpServletResponse response) throws Exception {
        exportService.exportLogs(response);
    }
}
