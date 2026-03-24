import api from './index'

// AI API 通过后端代理层调用，不直接暴露 Python 服务
export const aiApi = {
  /** 风险预测 */
  predictRisk: (campusId: number = 1) =>
    api.post('/ai/risk-prediction', null, { params: { campusId } }),

  /** 热力图数据 */
  getHeatmap: (params?: { center_lng?: number; center_lat?: number; grid_size?: number }) =>
    api.post('/ai/heatmap', null, {
      params: {
        centerLng: params?.center_lng ?? 110.3308,
        centerLat: params?.center_lat ?? 20.0588,
        gridSize: params?.grid_size ?? 20,
      }
    }),

  /** 历史事件分析 */
  analyzeEvents: (days: number = 90) =>
    api.get('/ai/event-analysis', { params: { days } }),

  /** 健康检查 */
  health: () =>
    api.get('/ai/health'),
}
