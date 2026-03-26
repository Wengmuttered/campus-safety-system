package com.campussafety.controller;

import com.campussafety.entity.User;
import com.campussafety.repository.UserRepository;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 个人中心 — 当前登录用户的信息管理
 */
@RestController
@RequestMapping("/api/profile")
@RequiredArgsConstructor
public class ProfileController {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    // 获取当前用户信息
    @GetMapping
    public ApiResponse<User> getProfile(Authentication auth) {
        User user = userRepository.findByUsername(auth.getName())
                .orElseThrow(() -> new RuntimeException("用户不存在"));
        user.setPassword(null);
        return ApiResponse.success(user);
    }

    // 更新个人信息
    @PutMapping
    public ApiResponse<User> updateProfile(Authentication auth, @RequestBody Map<String, Object> updates) {
        User user = userRepository.findByUsername(auth.getName())
                .orElseThrow(() -> new RuntimeException("用户不存在"));
        if (updates.containsKey("realName")) user.setRealName((String) updates.get("realName"));
        if (updates.containsKey("phone")) user.setPhone((String) updates.get("phone"));
        if (updates.containsKey("email")) user.setEmail((String) updates.get("email"));
        if (updates.containsKey("department")) user.setDepartment((String) updates.get("department"));
        User saved = userRepository.save(user);
        saved.setPassword(null);
        return ApiResponse.success("信息已更新", saved);
    }

    // 修改密码
    @PutMapping("/password")
    public ApiResponse<Void> changePassword(Authentication auth, @RequestBody Map<String, String> body) {
        User user = userRepository.findByUsername(auth.getName())
                .orElseThrow(() -> new RuntimeException("用户不存在"));

        String oldPassword = body.get("oldPassword");
        String newPassword = body.get("newPassword");

        if (oldPassword == null || newPassword == null) {
            return ApiResponse.error("请填写原密码和新密码");
        }
        if (!passwordEncoder.matches(oldPassword, user.getPassword())) {
            return ApiResponse.error("原密码错误");
        }
        if (newPassword.length() < 6) {
            return ApiResponse.error("新密码至少6位");
        }

        user.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user);
        return ApiResponse.success("密码修改成功", null);
    }
}
