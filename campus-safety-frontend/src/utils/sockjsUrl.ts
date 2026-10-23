/** SockJS STOMP 入口：同源 Nginx；开发可设 VITE_WS_URL；生产子路径下走 /campus-ws 避免与主站 /ws 冲突 */
export function resolveSockJsUrl(): string {
  const env = import.meta.env.VITE_WS_URL?.trim()
  if (env) return env
  if (typeof window === 'undefined') return 'http://localhost:8088/ws'
  const base = import.meta.env.BASE_URL || '/'
  const path = base !== '/' ? '/campus-ws' : '/ws'
  return `${window.location.protocol}//${window.location.host}${path}`
}
