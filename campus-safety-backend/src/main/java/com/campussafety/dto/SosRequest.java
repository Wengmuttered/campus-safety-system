package com.campussafety.dto;

import com.campussafety.entity.AlertRecord;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class SosRequest {
    @NotNull(message = "报警类型不能为空")
    private AlertRecord.AlertType alertType;

    private Double lng;
    private Double lat;
    private String locationDesc;
    private String content;
}
