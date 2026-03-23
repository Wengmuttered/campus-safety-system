package com.campussafety.dto;

import com.campussafety.entity.User;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class RegisterRequest {
    @NotBlank(message = "用户名不能为空")
    private String username;

    @NotBlank(message = "密码不能为空")
    private String password;

    private String realName;
    private String phone;
    private String email;

    @NotNull(message = "角色不能为空")
    private User.UserRole role;

    private Long campusId;
    private String department;
}
