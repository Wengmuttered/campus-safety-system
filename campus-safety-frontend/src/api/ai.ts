import api from './index'

const AI_BASE = 'http://localhost:8089/api/ai'

export const aiApi = {
  /** 风险预测 */
  predictRisk: (campusId: number = 1) =>
    api.post(`${AI_BASE}/risk-prediction`, { campus_id: campusId }, { baseURL: '' }),

  /** 热力图数据 */
  getHeatmap: (params?: { center_lng?: number; center_lat?: number; grid_size?: number }) =>
    api.post(`${AI_BASE}/heatmap`, {
      campus_id: 1,
      center_lng: params?.center_lng ?? 110.3308,
      center_lat: params?.center_lat ?? 20.0588,
      grid_size: params?.grid_size ?? 20,
    }, { baseURL: '' }),

  /** 历史事件分析 */
  analyzeEvents: (days: number = 90) =>
    api.get(`${AI_BASE}/event-analysis`, { params: { days }, baseURL: '' }),

  /** 健康检查 */
  health: () =>
    api.get(`${AI_BASE}/health`, { baseURL: '' }),
}
