import axios from 'axios'
import { ElMessage } from 'element-plus'

const api = axios.create({
  baseURL: 'http://localhost:8088/api',
  timeout: 10000,
  headers: {
    'Content-Type': 'application/json'
  }
})

// 请求拦截器 - 自动附加JWT
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('token')
    if (token) {
      config.headers.Authorization = `Bearer ${token}`
    }
    return config
  },
  (error) => Promise.reject(error)
)

// 响应拦截器
api.interceptors.response.use(
  (response) => response.data,
  (error) => {
    if (error.response?.status === 401) {
      localStorage.removeItem('token')
      window.location.href = '/login'
      ElMessage.error('登录已过期，请重新登录')
    } else {
      ElMessage.error(error.response?.data?.message || '请求失败')
    }
    return Promise.reject(error)
  }
)

export default api

// ========== 认证 API ==========
export const authApi = {
  login: (data: { username: string; password: string }) =>
    api.post('/auth/login', data),
  register: (data: any) =>
    api.post('/auth/register', data)
}

// ========== 地图 API ==========
export const mapApi = {
  getCampuses: () => api.get('/map/campuses'),
  getCampus: (id: number) => api.get(`/map/campus/${id}`),
  getBuildings: (campusId: number) => api.get('/map/buildings', { params: { campusId } })
}

// ========== 安全点位 API ==========
export const safetyPointApi = {
  getPoints: (campusId: number) => api.get('/safety-points', { params: { campusId } }),
  create: (data: any) => api.post('/safety-points', data),
  createPoint: (data: any) => api.post('/safety-points', data),
  update: (id: number, data: any) => api.put(`/safety-points/${id}`, data),
  updatePoint: (id: number, data: any) => api.put(`/safety-points/${id}`, data),
  updateStatus: (id: number, status: string) =>
    api.put(`/safety-points/${id}/status`, null, { params: { status } }),
  delete: (id: number) => api.delete(`/safety-points/${id}`),
  deletePoint: (id: number) => api.delete(`/safety-points/${id}`)
}

// ========== 报警 API ==========
export const alertApi = {
  sendSos: (data: any) => api.post('/alerts/sos', data),
  getAlerts: (status: string, page = 0, size = 20) =>
    api.get('/alerts', { params: { status, page, size } }),
  handleAlert: (id: number, handlerId: number, note?: string) =>
    api.put(`/alerts/${id}/handle`, null, { params: { handlerId, note } })
}

// ========== 事件 API ==========
export const eventApi = {
  getEvents: (campusId: number, page = 0, size = 20, status?: string) =>
    api.get('/events', { params: { campusId, page, size, ...(status ? { status } : {}) } }),
  createEvent: (data: any) => api.post('/events', data),
  updateStatus: (id: number, status: string) =>
    api.put(`/events/${id}/status`, null, { params: { status } })
}

// ========== 疏散路线 API ==========
export const evacuationApi = {
  getRoutes: (buildingId: number) =>
    api.get('/evacuation/routes', { params: { buildingId } })
}

// ========== 演练 API ==========
export const drillApi = {
  getDrills: (campusId: number) =>
    api.get('/drills', { params: { campusId } }),
  createDrill: (data: any) => api.post('/drills', data),
  updateStatus: (id: number, status: string) =>
    api.put(`/drills/${id}/status`, null, { params: { status } }),
  updateSummary: (id: number, summary: string) =>
    api.put(`/drills/${id}/summary`, { summary })
}

// ========== 仪表盘 API ==========
export const dashboardApi = {
  getStats: (campusId = 1) =>
    api.get('/dashboard/stats', { params: { campusId } })
}

// ========== 用户管理 API ==========
export const userApi = {
  getUsers: (page = 0, size = 20) =>
    api.get('/users', { params: { page, size } }),
  updateRole: (id: number, role: string) =>
    api.put(`/users/${id}/role`, null, { params: { role } }),
  toggleEnabled: (id: number) =>
    api.put(`/users/${id}/toggle`),
  updateUser: (id: number, data: any) =>
    api.put(`/users/${id}`, data),
  deleteUser: (id: number) =>
    api.delete(`/users/${id}`),
  resetPassword: (id: number) =>
    api.put(`/users/${id}/reset-password`)
}
