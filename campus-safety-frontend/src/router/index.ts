import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: '/login',
    name: 'Login',
    component: () => import('../views/LoginView.vue'),
    meta: { requiresAuth: false }
  },
  {
    path: '/',
    component: () => import('../layouts/MainLayout.vue'),
    meta: { requiresAuth: true },
    children: [
      { path: '', redirect: '/dashboard' },
      { path: 'dashboard', name: 'Dashboard', component: () => import('../views/DashboardView.vue'), meta: { title: '控制台' } },
      { path: 'map', name: 'Map', component: () => import('../views/MapView.vue'), meta: { title: '校园地图', keepAlive: true } },
      { path: 'monitor', name: 'Monitor', component: () => import('../views/MonitorView.vue'), meta: { title: 'AI视频监控网', roles: ['ADMIN', 'SECURITY'] } },
      { path: 'alert', name: 'Alert', component: () => import('../views/AlertView.vue'), meta: { title: '一键求助' } },
      { path: 'events', name: 'Events', component: () => import('../views/EventsView.vue'), meta: { title: '事件管理', roles: ['ADMIN', 'SECURITY'] } },
      { path: 'evacuation', name: 'Evacuation', component: () => import('../views/EvacuationView.vue'), meta: { title: '疏散导航' } },
      { path: 'drill', name: 'Drill', component: () => import('../views/DrillView.vue'), meta: { title: '应急演练', roles: ['ADMIN', 'SECURITY'] } },
      { path: 'risk', name: 'Risk', component: () => import('../views/RiskView.vue'), meta: { title: '风险分析', roles: ['ADMIN', 'SECURITY'] } },
      // 安全管理模块
      { path: 'inspection', name: 'Inspection', component: () => import('../views/InspectionView.vue'), meta: { title: '安全巡检', roles: ['ADMIN', 'SECURITY'] } },
      { path: 'hazard', name: 'Hazard', component: () => import('../views/HazardView.vue'), meta: { title: '隐患排查', roles: ['ADMIN', 'SECURITY', 'TEACHER'] } },
      { path: 'plans', name: 'Plans', component: () => import('../views/PlanView.vue'), meta: { title: '应急预案', roles: ['ADMIN', 'SECURITY'] } },
      { path: 'supplies', name: 'Supplies', component: () => import('../views/SupplyView.vue'), meta: { title: '物资管理', roles: ['ADMIN', 'SECURITY'] } },
      { path: 'duty', name: 'Duty', component: () => import('../views/DutyView.vue'), meta: { title: '值班管理', roles: ['ADMIN', 'SECURITY'] } },
      { path: 'notices', name: 'Notices', component: () => import('../views/NoticeView.vue'), meta: { title: '通知公告' } },
      { path: 'training', name: 'Training', component: () => import('../views/TrainingView.vue'), meta: { title: '安全培训' } },
      { path: 'statistics', name: 'Statistics', component: () => import('../views/StatisticsView.vue'), meta: { title: '统计分析', roles: ['ADMIN', 'SECURITY'] } },
      { path: 'logs', name: 'Logs', component: () => import('../views/LogView.vue'), meta: { title: '操作日志', roles: ['ADMIN'] } },
      { path: 'profile', name: 'Profile', component: () => import('../views/ProfileView.vue'), meta: { title: '个人中心' } },
      // 系统管理
      { path: 'users', name: 'Users', component: () => import('../views/UserManageView.vue'), meta: { title: '用户管理', roles: ['ADMIN'] } },
      { path: 'safety-points', name: 'SafetyPoints', component: () => import('../views/SafetyPointManageView.vue'), meta: { title: '点位管理', roles: ['ADMIN'] } },
      { path: 'settings', name: 'Settings', component: () => import('../views/SystemSettingsView.vue'), meta: { title: '系统设置', roles: ['ADMIN'] } }
    ]
  },
  {
    path: '/403',
    name: 'Forbidden',
    component: { template: `<div style="display:flex;flex-direction:column;align-items:center;justify-content:center;height:100vh;background:#0f1923;color:#e2e8f0"><h1 style="font-size:72px;margin:0">403</h1><p style="font-size:18px;color:#a0aec0">权限不足，无法访问此页面</p><a href="/" style="margin-top:16px;color:#4299e1;text-decoration:none">返回首页</a></div>` }
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

// 路由守卫：认证 + 角色权限
router.beforeEach((to, _from, next) => {
  const token = localStorage.getItem('token')
  // 未登录检查
  if (to.meta.requiresAuth !== false && !token) {
    next('/login')
    return
  }
  // 角色权限检查
  const roles = to.meta.roles as string[] | undefined
  if (roles && roles.length > 0) {
    const userStr = localStorage.getItem('userInfo')
    if (userStr) {
      try {
        const user = JSON.parse(userStr)
        if (!roles.includes(user.role)) {
          next('/403')
          return
        }
      } catch { /* 解析失败让通过 */ }
    }
  }
  next()
})

export default router
