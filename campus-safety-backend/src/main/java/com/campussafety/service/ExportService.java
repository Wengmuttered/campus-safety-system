package com.campussafety.service;

import com.campussafety.entity.*;
import com.campussafety.repository.*;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 * Excel报表导出服务
 */
@Service
@RequiredArgsConstructor
public class ExportService {

    private final InspectionTaskRepository inspectionRepo;
    private final HazardReportRepository hazardRepo;
    private final EmergencySupplyRepository supplyRepo;
    private final OperationLogRepository logRepo;
    private final DutyScheduleRepository dutyRepo;

    private static final DateTimeFormatter FMT = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

    /**
     * 导出巡检任务报表
     */
    public void exportInspections(Long campusId, HttpServletResponse response) throws IOException {
        List<InspectionTask> list = inspectionRepo.findByCampusIdOrderByCreatedAtDesc(campusId,
                org.springframework.data.domain.Pageable.unpaged()).getContent();
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("巡检任务");
        CellStyle headerStyle = createHeaderStyle(wb);
        String[] headers = {"ID","任务名称","类型","巡检区域","负责人ID","状态","结果","异常数","计划时间","完成时间","备注"};
        Row headerRow = sheet.createRow(0);
        for (int i = 0; i < headers.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers[i]);
            cell.setCellStyle(headerStyle);
        }
        int rowNum = 1;
        for (InspectionTask t : list) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(t.getId());
            row.createCell(1).setCellValue(t.getTitle());
            row.createCell(2).setCellValue(t.getType() != null ? t.getType().name() : "");
            row.createCell(3).setCellValue(t.getArea() != null ? t.getArea() : "");
            row.createCell(4).setCellValue(t.getAssigneeId() != null ? t.getAssigneeId() : 0);
            row.createCell(5).setCellValue(t.getStatus() != null ? t.getStatus().name() : "");
            row.createCell(6).setCellValue(t.getResult() != null ? t.getResult().name() : "");
            row.createCell(7).setCellValue(t.getIssueCount() != null ? t.getIssueCount() : 0);
            row.createCell(8).setCellValue(t.getScheduledAt() != null ? t.getScheduledAt().format(FMT) : "");
            row.createCell(9).setCellValue(t.getCompletedAt() != null ? t.getCompletedAt().format(FMT) : "");
            row.createCell(10).setCellValue(t.getRemark() != null ? t.getRemark() : "");
        }
        autoSizeColumns(sheet, headers.length);
        writeResponse(response, wb, "巡检任务报表.xlsx");
    }

    /**
     * 导出隐患报告
     */
    public void exportHazards(Long campusId, HttpServletResponse response) throws IOException {
        List<HazardReport> list = hazardRepo.findByCampusIdOrderByCreatedAtDesc(campusId,
                org.springframework.data.domain.Pageable.unpaged()).getContent();
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("隐患报告");
        CellStyle headerStyle = createHeaderStyle(wb);
        String[] headers = {"ID","隐患标题","类型","级别","位置","状态","上报人ID","整改期限","描述"};
        Row headerRow = sheet.createRow(0);
        for (int i = 0; i < headers.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers[i]);
            cell.setCellStyle(headerStyle);
        }
        int rowNum = 1;
        for (HazardReport h : list) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(h.getId());
            row.createCell(1).setCellValue(h.getTitle());
            row.createCell(2).setCellValue(h.getType() != null ? h.getType().name() : "");
            row.createCell(3).setCellValue(h.getLevel() != null ? h.getLevel().name() : "");
            row.createCell(4).setCellValue(h.getLocationDesc() != null ? h.getLocationDesc() : "");
            row.createCell(5).setCellValue(h.getStatus() != null ? h.getStatus().name() : "");
            row.createCell(6).setCellValue(h.getReporterId() != null ? h.getReporterId() : 0);
            row.createCell(7).setCellValue(h.getDeadline() != null ? h.getDeadline().format(FMT) : "");
            row.createCell(8).setCellValue(h.getDescription() != null ? h.getDescription() : "");
        }
        autoSizeColumns(sheet, headers.length);
        writeResponse(response, wb, "隐患报告.xlsx");
    }

    /**
     * 导出物资台账
     */
    public void exportSupplies(Long campusId, HttpServletResponse response) throws IOException {
        List<EmergencySupply> list = supplyRepo.findByCampusIdOrderByCreatedAtDesc(campusId,
                org.springframework.data.domain.Pageable.unpaged()).getContent();
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("物资台账");
        CellStyle headerStyle = createHeaderStyle(wb);
        String[] headers = {"ID","物资名称","分类","型号","数量","单位","存放位置","管理员","状态","有效期","最低库存"};
        Row headerRow = sheet.createRow(0);
        for (int i = 0; i < headers.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers[i]);
            cell.setCellStyle(headerStyle);
        }
        int rowNum = 1;
        for (EmergencySupply s : list) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(s.getId());
            row.createCell(1).setCellValue(s.getName());
            row.createCell(2).setCellValue(s.getCategory() != null ? s.getCategory().name() : "");
            row.createCell(3).setCellValue(s.getModel() != null ? s.getModel() : "");
            row.createCell(4).setCellValue(s.getQuantity() != null ? s.getQuantity() : 0);
            row.createCell(5).setCellValue(s.getUnit() != null ? s.getUnit() : "");
            row.createCell(6).setCellValue(s.getWarehouseLocation() != null ? s.getWarehouseLocation() : "");
            row.createCell(7).setCellValue(s.getManager() != null ? s.getManager() : "");
            row.createCell(8).setCellValue(s.getStatus() != null ? s.getStatus().name() : "");
            row.createCell(9).setCellValue(s.getExpiryDate() != null ? s.getExpiryDate().toString() : "");
            row.createCell(10).setCellValue(s.getMinStock() != null ? s.getMinStock() : 0);
        }
        autoSizeColumns(sheet, headers.length);
        writeResponse(response, wb, "物资台账.xlsx");
    }

    /**
     * 导出操作日志
     */
    public void exportLogs(HttpServletResponse response) throws IOException {
        List<OperationLog> list = logRepo.findAll(org.springframework.data.domain.Sort.by(
                org.springframework.data.domain.Sort.Direction.DESC, "createdAt"));
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("操作日志");
        CellStyle headerStyle = createHeaderStyle(wb);
        String[] headers = {"ID","用户","模块","操作","目标","IP","时间","详情"};
        Row headerRow = sheet.createRow(0);
        for (int i = 0; i < headers.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers[i]);
            cell.setCellStyle(headerStyle);
        }
        int rowNum = 1;
        for (OperationLog l : list) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(l.getId());
            row.createCell(1).setCellValue(l.getUsername() != null ? l.getUsername() : "");
            row.createCell(2).setCellValue(l.getModule() != null ? l.getModule() : "");
            row.createCell(3).setCellValue(l.getAction() != null ? l.getAction() : "");
            row.createCell(4).setCellValue(l.getTarget() != null ? l.getTarget() : "");
            row.createCell(5).setCellValue(l.getIp() != null ? l.getIp() : "");
            row.createCell(6).setCellValue(l.getCreatedAt() != null ? l.getCreatedAt().format(FMT) : "");
            row.createCell(7).setCellValue(l.getDetail() != null ? l.getDetail() : "");
        }
        autoSizeColumns(sheet, headers.length);
        writeResponse(response, wb, "操作日志.xlsx");
    }

    // ========== 工具方法 ==========

    private CellStyle createHeaderStyle(Workbook wb) {
        CellStyle style = wb.createCellStyle();
        Font font = wb.createFont();
        font.setBold(true);
        font.setFontHeightInPoints((short) 12);
        style.setFont(font);
        style.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderTop(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
        return style;
    }

    private void autoSizeColumns(Sheet sheet, int count) {
        for (int i = 0; i < count; i++) {
            sheet.autoSizeColumn(i);
            int width = sheet.getColumnWidth(i);
            sheet.setColumnWidth(i, Math.min(width + 512, 8000));
        }
    }

    private void writeResponse(HttpServletResponse response, Workbook wb, String filename) throws IOException {
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=" +
                java.net.URLEncoder.encode(filename, "UTF-8"));
        wb.write(response.getOutputStream());
        wb.close();
    }
}
