package com.campussafety.controller;

import com.campussafety.util.ApiResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/api/files")
@Slf4j
public class FileController {

    @Value("${file.upload-dir:./uploads}")
    private String uploadDir;

    @PostMapping("/upload")
    public ApiResponse<Map<String, String>> upload(@RequestParam("file") MultipartFile file) {
        try {
            Path uploadPath = Paths.get(uploadDir);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            String originalFilename = file.getOriginalFilename();
            String ext = originalFilename != null && originalFilename.contains(".")
                    ? originalFilename.substring(originalFilename.lastIndexOf(".")) : "";
            String newFilename = UUID.randomUUID().toString().replace("-", "") + ext;

            Path filePath = uploadPath.resolve(newFilename);
            file.transferTo(filePath.toFile());

            String url = "/api/files/" + newFilename;
            log.info("文件上传成功: {} -> {}", originalFilename, newFilename);

            return ApiResponse.success("上传成功", Map.of(
                    "url", url,
                    "filename", newFilename,
                    "originalName", originalFilename != null ? originalFilename : ""
            ));
        } catch (IOException e) {
            log.error("文件上传失败", e);
            return ApiResponse.error("文件上传失败: " + e.getMessage());
        }
    }

    @GetMapping("/{filename}")
    public void download(@PathVariable String filename,
                         jakarta.servlet.http.HttpServletResponse response) {
        try {
            Path filePath = Paths.get(uploadDir).resolve(filename);
            if (!Files.exists(filePath)) {
                response.setStatus(404);
                return;
            }

            String contentType = Files.probeContentType(filePath);
            if (contentType == null) contentType = "application/octet-stream";

            response.setContentType(contentType);
            response.setHeader("Content-Disposition", "inline; filename=\"" + filename + "\"");
            Files.copy(filePath, response.getOutputStream());
        } catch (IOException e) {
            log.error("文件下载失败", e);
        }
    }
}
