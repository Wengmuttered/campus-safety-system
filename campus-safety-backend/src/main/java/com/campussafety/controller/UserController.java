package com.campussafety.controller;

import com.campussafety.entity.User;
import com.campussafety.repository.UserRepository;
import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @GetMapping
    public ApiResponse<Page<User>> getUsers(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        Page<User> users = userRepository.findAll(
            PageRequest.of(page, size, Sort.by(Sort.Direction.DESC, "createdAt")));
        // 不返回密码
        users.getContent().forEach(u -> u.setPassword(null));
        return ApiResponse.success(users);
    }

    @PutMapping("/{id}/role")
    public ApiResponse<User> updateRole(@PathVariable Long id,
                                          @RequestParam User.UserRole role) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("用户不存在"));
        user.setRole(role);
        User saved = userRepository.save(user);
        saved.setPassword(null);
        return ApiResponse.success("角色已更新", saved);
    }

    @PutMapping("/{id}/toggle")
    public ApiResponse<User> toggleEnabled(@PathVariable Long id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("用户不存在"));
        user.setEnabled(!user.getEnabled());
        User saved = userRepository.save(user);
        saved.setPassword(null);
        return ApiResponse.success(
            user.getEnabled() ? "已启用" : "已禁用", saved);
    }

    @PutMapping("/{id}")
    public ApiResponse<User> updateUser(@PathVariable Long id,
                                          @RequestBody Map<String, Object> updates) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("用户不存在"));
        if (updates.containsKey("realName")) user.setRealName((String) updates.get("realName"));
        if (updates.containsKey("phone")) user.setPhone((String) updates.get("phone"));
        if (updates.containsKey("email")) user.setEmail((String) updates.get("email"));
        if (updates.containsKey("department")) user.setDepartment((String) updates.get("department"));
        User saved = userRepository.save(user);
        saved.setPassword(null);
        return ApiResponse.success("更新成功", saved);
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> deleteUser(@PathVariable Long id) {
        userRepository.deleteById(id);
        return ApiResponse.success("已删除", null);
    }

    @PutMapping("/{id}/reset-password")
    public ApiResponse<Void> resetPassword(@PathVariable Long id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("用户不存在"));
        user.setPassword(passwordEncoder.encode("123456"));
        userRepository.save(user);
        return ApiResponse.success("密码已重置为123456", null);
    }
}
