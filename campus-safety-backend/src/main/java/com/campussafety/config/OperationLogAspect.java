package com.campussafety.config;

import com.campussafety.entity.OperationLog;
import com.campussafety.repository.OperationLogRepository;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * AOP切面 — 自动记录Controller层关键操作日志
 */
@Aspect
@Component
@RequiredArgsConstructor
@Slf4j
public class OperationLogAspect {

    private final OperationLogRepository logRepository;

    /**
     * 拦截所有Controller中的POST/PUT/DELETE操作
     */
    @AfterReturning(
        pointcut = "execution(* com.campussafety.controller..*.create*(..)) || " +
                   "execution(* com.campussafety.controller..*.update*(..)) || " +
                   "execution(* com.campussafety.controller..*.delete*(..)) || " +
                   "execution(* com.campussafety.controller..*.handle*(..)) || " +
                   "execution(* com.campussafety.controller..*.publish*(..)) || " +
                   "execution(* com.campussafety.controller..*.archive*(..)) || " +
                   "execution(* com.campussafety.controller..*.batch*(..)) || " +
                   "execution(* com.campussafety.controller..*.submit*(..)) || " +
                   "execution(* com.campussafety.controller..*.start*(..)) || " +
                   "execution(* com.campussafety.controller..*.complete*(..)) || " +
                   "execution(* com.campussafety.controller..*.toggle*(..)) || " +
                   "execution(* com.campussafety.controller..*.reset*(..)) || " +
                   "execution(* com.campussafety.controller.AuthController.login(..))",
        returning = "result"
    )
    public void logOperation(JoinPoint joinPoint, Object result) {
        try {
            String methodName = joinPoint.getSignature().getName();
            String className = joinPoint.getTarget().getClass().getSimpleName();
            String module = resolveModule(className);
            String action = resolveAction(methodName);

            String username = "anonymous";
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            if (auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal())) {
                username = auth.getPrincipal().toString();
            }

            // 如果是登录操作，从参数中提取用户名
            if ("login".equals(methodName) && joinPoint.getArgs().length > 0) {
                try {
                    Object arg = joinPoint.getArgs()[0];
                    var field = arg.getClass().getDeclaredField("username");
                    field.setAccessible(true);
                    username = (String) field.get(arg);
                } catch (Exception ignored) {}
            }

            String ip = getClientIp();
            String target = className + "." + methodName;

            // 构建详情（简化参数信息）
            StringBuilder detail = new StringBuilder();
            Object[] args = joinPoint.getArgs();
            if (args.length > 0) {
                for (Object arg : args) {
                    if (arg != null && !(arg instanceof HttpServletRequest)) {
                        String argStr = arg.toString();
                        if (argStr.length() > 200) argStr = argStr.substring(0, 200) + "...";
                        detail.append(arg.getClass().getSimpleName()).append(": ").append(argStr).append("; ");
                    }
                }
            }

            OperationLog operationLog = OperationLog.builder()
                    .username(username)
                    .module(module)
                    .action(action)
                    .target(target)
                    .detail(detail.length() > 0 ? detail.toString() : null)
                    .ip(ip)
                    .build();

            logRepository.save(operationLog);
        } catch (Exception e) {
            log.warn("操作日志记录失败: {}", e.getMessage());
        }
    }

    private String resolveModule(String className) {
        if (className.contains("Auth")) return "认证";
        if (className.contains("Event")) return "事件";
        if (className.contains("Alert")) return "报警";
        if (className.contains("Inspection")) return "巡检";
        if (className.contains("Hazard")) return "隐患";
        if (className.contains("Plan")) return "预案";
        if (className.contains("Supply")) return "物资";
        if (className.contains("Duty")) return "值班";
        if (className.contains("Notice")) return "通知";
        if (className.contains("Training")) return "培训";
        if (className.contains("Drill")) return "演练";
        if (className.contains("User")) return "用户";
        if (className.contains("SafetyPoint")) return "点位";
        if (className.contains("File")) return "文件";
        return "系统";
    }

    private String resolveAction(String methodName) {
        if (methodName.startsWith("create") || methodName.startsWith("add")) return "新增";
        if (methodName.startsWith("update")) return "更新";
        if (methodName.startsWith("delete")) return "删除";
        if (methodName.startsWith("handle")) return "处理";
        if (methodName.startsWith("publish")) return "发布";
        if (methodName.startsWith("archive")) return "归档";
        if (methodName.startsWith("batch")) return "批量操作";
        if (methodName.startsWith("submit")) return "提交";
        if (methodName.startsWith("start")) return "开始";
        if (methodName.startsWith("complete")) return "完成";
        if (methodName.startsWith("toggle")) return "切换状态";
        if (methodName.startsWith("reset")) return "重置";
        if (methodName.equals("login")) return "登录";
        return methodName;
    }

    private String getClientIp() {
        try {
            ServletRequestAttributes attributes =
                    (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            if (attributes != null) {
                HttpServletRequest request = attributes.getRequest();
                String ip = request.getHeader("X-Forwarded-For");
                if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
                    ip = request.getHeader("X-Real-IP");
                }
                if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
                    ip = request.getRemoteAddr();
                }
                return ip;
            }
        } catch (Exception ignored) {}
        return "unknown";
    }
}
