import axios from 'axios'
import { ElMessage } from 'element-plus'

const api = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL || '/api',
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

/** 地图在线图层（数据库配置，叠加顺序见 zOrder） */
export const mapLayerApi = {
  list: () => api.get('/map/layers'),
  patch: (id: number, data: { visible?: boolean; opacity?: number }) =>
    api.patch(`/map/layers/${id}`, data)
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
    api.get('/evacuation/routes', { params: { buildingId } }),
  recommend: (buildingId: number, currentFloor = 1, personCount = 100) =>
    api.get('/evacuation/recommend', { params: { buildingId, currentFloor, personCount } })
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

// ========== 巡检管理 API ==========
export const inspectionApi = {
  getTasks: (campusId: number, page = 0, size = 20, status?: string) =>
    api.get('/inspections', { params: { campusId, page, size, ...(status ? { status } : {}) } }),
  createTask: (data: any) => api.post('/inspections', data),
  updateTask: (id: number, data: any) => api.put(`/inspections/${id}`, data),
  updateStatus: (id: number, status: string) =>
    api.put(`/inspections/${id}/status`, null, { params: { status } }),
  completeTask: (id: number, data: any) => api.put(`/inspections/${id}/complete`, data),
  deleteTask: (id: number) => api.delete(`/inspections/${id}`),
  getStats: (campusId: number) => api.get('/inspections/stats', { params: { campusId } }),
  getRecords: (taskId: number) => api.get(`/inspections/${taskId}/records`),
  addRecord: (taskId: number, data: any) => api.post(`/inspections/${taskId}/records`, data)
}

// ========== 隐患排查 API ==========
export const hazardApi = {
  getHazards: (campusId: number, page = 0, size = 20, status?: string) =>
    api.get('/hazards', { params: { campusId, page, size, ...(status ? { status } : {}) } }),
  create: (data: any) => api.post('/hazards', data),
  update: (id: number, data: any) => api.put(`/hazards/${id}`, data),
  updateStatus: (id: number, status: string) =>
    api.put(`/hazards/${id}/status`, null, { params: { status } }),
  submitRectification: (id: number, data: any) => api.put(`/hazards/${id}/rectify`, data),
  delete: (id: number) => api.delete(`/hazards/${id}`),
  getStats: (campusId: number) => api.get('/hazards/stats', { params: { campusId } })
}

// ========== 应急预案 API ==========
export const planApi = {
  getPlans: (campusId: number, page = 0, size = 20, status?: string) =>
    api.get('/plans', { params: { campusId, page, size, ...(status ? { status } : {}) } }),
  getPlan: (id: number) => api.get(`/plans/${id}`),
  create: (data: any) => api.post('/plans', data),
  update: (id: number, data: any) => api.put(`/plans/${id}`, data),
  publish: (id: number) => api.put(`/plans/${id}/publish`),
  archive: (id: number) => api.put(`/plans/${id}/archive`),
  delete: (id: number) => api.delete(`/plans/${id}`)
}

// ========== 物资管理 API ==========
export const supplyApi = {
  getSupplies: (campusId: number, page = 0, size = 20, category?: string) =>
    api.get('/supplies', { params: { campusId, page, size, ...(category ? { category } : {}) } }),
  create: (data: any) => api.post('/supplies', data),
  update: (id: number, data: any) => api.put(`/supplies/${id}`, data),
  delete: (id: number) => api.delete(`/supplies/${id}`),
  addRecord: (id: number, data: any) => api.post(`/supplies/${id}/record`, data),
  getRecords: (id: number) => api.get(`/supplies/${id}/records`),
  getWarnings: (campusId: number) => api.get('/supplies/warnings', { params: { campusId } })
}

// ========== 值班排班 API ==========
export const dutyApi = {
  getDuties: (campusId: number, start: string, end: string) =>
    api.get('/duties', { params: { campusId, start, end } }),
  getToday: (campusId: number) => api.get('/duties/today', { params: { campusId } }),
  create: (data: any) => api.post('/duties', data),
  batchCreate: (data: any[]) => api.post('/duties/batch', data),
  update: (id: number, data: any) => api.put(`/duties/${id}`, data),
  updateStatus: (id: number, status: string) =>
    api.put(`/duties/${id}/status`, null, { params: { status } }),
  delete: (id: number) => api.delete(`/duties/${id}`)
}

// ========== 通知公告 API ==========
export const noticeApi = {
  getNotices: (campusId: number, page = 0, size = 20, status?: string) =>
    api.get('/notices', { params: { campusId, page, size, ...(status ? { status } : {}) } }),
  create: (data: any) => api.post('/notices', data),
  update: (id: number, data: any) => api.put(`/notices/${id}`, data),
  publish: (id: number) => api.put(`/notices/${id}/publish`),
  delete: (id: number) => api.delete(`/notices/${id}`)
}

// ========== 培训管理 API ==========
export const trainingApi = {
  getCourses: (campusId: number, page = 0, size = 20, status?: string) =>
    api.get('/training/courses', { params: { campusId, page, size, ...(status ? { status } : {}) } }),
  getCourse: (id: number) => api.get(`/training/courses/${id}`),
  createCourse: (data: any) => api.post('/training/courses', data),
  updateCourse: (id: number, data: any) => api.put(`/training/courses/${id}`, data),
  publishCourse: (id: number) => api.put(`/training/courses/${id}/publish`),
  deleteCourse: (id: number) => api.delete(`/training/courses/${id}`),
  getUserRecords: (userId: number) => api.get('/training/records', { params: { userId } }),
  enroll: (courseId: number, userId: number) =>
    api.post(`/training/courses/${courseId}/enroll`, null, { params: { userId } }),
  updateProgress: (recordId: number, data: any) => api.put(`/training/records/${recordId}/progress`, data),
  getCourseStats: (courseId: number) => api.get(`/training/courses/${courseId}/stats`)
}

// ========== 操作日志 API ==========
export const logApi = {
  getLogs: (page = 0, size = 20, module?: string, username?: string) =>
    api.get('/logs', { params: { page, size, ...(module ? { module } : {}), ...(username ? { username } : {}) } })
}

// ========== 文件上传 API ==========
export const fileApi = {
  upload: (file: File) => {
    const formData = new FormData()
    formData.append('file', file)
    return api.post('/files/upload', formData, {
      headers: { 'Content-Type': 'multipart/form-data' }
    })
  }
}

// ========== 个人中心 API ==========
export const profileApi = {
  getProfile: () => api.get('/profile'),
  updateProfile: (data: any) => api.put('/profile', data),
  changePassword: (data: { oldPassword: string; newPassword: string }) =>
    api.put('/profile/password', data)
}

// ========== 统计分析 API ==========
export const statisticsApi = {
  overview: (campusId = 1) => api.get('/statistics/overview', { params: { campusId } }),
  hazardByType: (campusId = 1) => api.get('/statistics/hazard-by-type', { params: { campusId } }),
  supplyByCategory: (campusId = 1) => api.get('/statistics/supply-by-category', { params: { campusId } })
}

// ========== 系统配置 API ==========
export const systemApi = {
  getAll: () => api.get('/system/configs'),
  getByCategory: (category: string) => api.get(`/system/configs/category/${category}`),
  getByKey: (key: string) => api.get(`/system/configs/key/${key}`),
  update: (data: any) => api.put('/system/configs', data),
  batchUpdate: (items: any[]) => api.put('/system/configs/batch', items),
  delete: (id: number) => api.delete(`/system/configs/${id}`)
}

// ========== AI API（通过后端代理，已移除前端直连 Python 服务）==========
export const aiApi = {
  ingestEvent: (data: any) => api.post('/ai/event-ingest', data),
  predictRisk: (data: any) => api.post('/ai/risk-prediction', data),
  getHeatmap: () => api.post('/ai/heatmap')
}
