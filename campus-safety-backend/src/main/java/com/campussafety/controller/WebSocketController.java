package com.campussafety.controller;

import com.campussafety.util.ApiResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * WebSocket 消息控制器
 * 处理实时通信：报警推送、预警广播、在线状态
 */
@RestController
@RequiredArgsConstructor
@Slf4j
public class WebSocketController {

    private final SimpMessagingTemplate messagingTemplate;

    /**
     * 接收前端STOMP消息 - 位置上报
     * 前端发送到 /app/location
     */
    @MessageMapping("/location")
    @SendTo("/topic/locations")
    public Map<String, Object> handleLocation(Map<String, Object> location) {
        location.put("serverTime", LocalDateTime.now().toString());
        log.debug("收到位置上报: {}", location);
        return location;
    }

    /**
     * 接收前端STOMP消息 - 紧急消息
     * 前端发送到 /app/emergency
     */
    @MessageMapping("/emergency")
    @SendTo("/topic/alerts")
    public Map<String, Object> handleEmergency(Map<String, Object> msg) {
        msg.put("type", "EMERGENCY");
        msg.put("time", LocalDateTime.now().toString());
        log.warn("收到紧急消息: {}", msg);
        return msg;
    }

    /**
     * REST接口 - 手动推送预警通知（供管理员使用）
     */
    @PostMapping("/api/notifications/broadcast")
    public ApiResponse<Void> broadcast(@RequestBody Map<String, Object> notification) {
        notification.put("time", LocalDateTime.now().toString());
        notification.put("type", "BROADCAST");
        messagingTemplate.convertAndSend("/topic/notifications", notification);
        log.info("广播通知已发送: {}", notification.get("title"));
        return ApiResponse.success("通知已广播", null);
    }

    /**
     * REST接口 - 向指定用户推送消息
     */
    @PostMapping("/api/notifications/send")
    public ApiResponse<Void> sendToUser(@RequestParam String username,
                                         @RequestBody Map<String, Object> message) {
        message.put("time", LocalDateTime.now().toString());
        messagingTemplate.convertAndSendToUser(username, "/queue/private", message);
        log.info("消息已推送给用户: {}", username);
        return ApiResponse.success("消息已发送", null);
    }
}
