package com.campussafety.controller;

import com.campussafety.dto.LoginRequest;
import com.campussafety.dto.RegisterRequest;
import com.campussafety.entity.User;
import com.campussafety.service.AuthService;
import com.campussafety.util.ApiResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping("/login")
    public ApiResponse<Map<String, Object>> login(@Valid @RequestBody LoginRequest request) {
        try {
            Map<String, Object> result = authService.login(request);
            return ApiResponse.success("登录成功", result);
        } catch (RuntimeException e) {
            return ApiResponse.error(401, e.getMessage());
        }
    }

    @PostMapping("/register")
    public ApiResponse<User> register(@Valid @RequestBody RegisterRequest request) {
        try {
            User user = authService.register(request);
            user.setPassword(null); // 不返回密码
            return ApiResponse.success("注册成功", user);
        } catch (RuntimeException e) {
            return ApiResponse.error(400, e.getMessage());
        }
    }
}
