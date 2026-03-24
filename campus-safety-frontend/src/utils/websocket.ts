import { Client } from '@stomp/stompjs'
import SockJS from 'sockjs-client/dist/sockjs'
import { ref } from 'vue'

const WS_URL = 'http://localhost:8088/ws'

// 全局状态
export const wsConnected = ref(false)
export const alertCount = ref(0)
export const latestAlert = ref<any>(null)
export const latestNotification = ref<any>(null)
export const notifications = ref<any[]>([])

let stompClient: Client | null = null

/**
 * 初始化 WebSocket 连接
 */
export function connectWebSocket() {
  if (stompClient?.active) return

  stompClient = new Client({
    webSocketFactory: () => new SockJS(WS_URL),
    reconnectDelay: 5000,
    heartbeatIncoming: 10000,
    heartbeatOutgoing: 10000,

    onConnect: () => {
      wsConnected.value = true
      console.log('[WS] 已连接')

      // 订阅告警通知
      stompClient!.subscribe('/topic/alerts', (message) => {
        const alert = JSON.parse(message.body)
        latestAlert.value = alert
        alertCount.value++
        notifications.value.unshift({
          type: 'alert',
          data: alert,
          time: new Date().toLocaleTimeString()
        })
        // 最多保留 50 条
        if (notifications.value.length > 50) notifications.value.pop()
      })

      // 订阅系统通知
      stompClient!.subscribe('/topic/notifications', (message) => {
        const notification = JSON.parse(message.body)
        latestNotification.value = notification
        alertCount.value++
        notifications.value.unshift({
          type: 'notification',
          data: notification,
          time: new Date().toLocaleTimeString()
        })
        if (notifications.value.length > 50) notifications.value.pop()
      })
    },

    onDisconnect: () => {
      wsConnected.value = false
      console.log('[WS] 已断开')
    },

    onStompError: (frame) => {
      console.error('[WS] STOMP 错误:', frame.headers['message'])
    }
  })

  stompClient.activate()
}

/**
 * 断开 WebSocket 连接
 */
export function disconnectWebSocket() {
  if (stompClient?.active) {
    stompClient.deactivate()
    stompClient = null
    wsConnected.value = false
  }
}

/**
 * 清除通知计数
 */
export function clearAlertCount() {
  alertCount.value = 0
}

/**
 * 发送紧急消息
 */
export function sendEmergencyMessage(msg: any) {
  if (stompClient?.active) {
    stompClient.publish({
      destination: '/app/emergency',
      body: JSON.stringify(msg)
    })
  }
}
