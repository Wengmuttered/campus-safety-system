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
      {
        path: '',
        redirect: '/dashboard'
      },
      {
        path: 'dashboard',
        name: 'Dashboard',
        component: () => import('../views/DashboardView.vue'),
        meta: { title: '控制台' }
      },
      {
        path: 'map',
        name: 'Map',
        component: () => import('../views/MapView.vue'),
        meta: { title: '校园地图' }
      },
      {
        path: 'alert',
        name: 'Alert',
        component: () => import('../views/AlertView.vue'),
        meta: { title: '一键求助' }
      },
      {
        path: 'events',
        name: 'Events',
        component: () => import('../views/EventsView.vue'),
        meta: { title: '事件管理' }
      },
      {
        path: 'evacuation',
        name: 'Evacuation',
        component: () => import('../views/EvacuationView.vue'),
        meta: { title: '疏散导航' }
      },
      {
        path: 'drill',
        name: 'Drill',
        component: () => import('../views/DrillView.vue'),
        meta: { title: '应急演练' }
      },
      {
        path: 'risk',
        name: 'Risk',
        component: () => import('../views/RiskView.vue'),
        meta: { title: '风险分析' }
      },
      // ===== 新增模块 =====
      {
        path: 'inspection',
        name: 'Inspection',
        component: () => import('../views/InspectionView.vue'),
        meta: { title: '安全巡检' }
      },
      {
        path: 'hazard',
        name: 'Hazard',
        component: () => import('../views/HazardView.vue'),
        meta: { title: '隐患排查' }
      },
      {
        path: 'plans',
        name: 'Plans',
        component: () => import('../views/PlanView.vue'),
        meta: { title: '应急预案' }
      },
      {
        path: 'supplies',
        name: 'Supplies',
        component: () => import('../views/SupplyView.vue'),
        meta: { title: '物资管理' }
      },
      {
        path: 'duty',
        name: 'Duty',
        component: () => import('../views/DutyView.vue'),
        meta: { title: '值班管理' }
      },
      {
        path: 'notices',
        name: 'Notices',
        component: () => import('../views/NoticeView.vue'),
        meta: { title: '通知公告' }
      },
      {
        path: 'training',
        name: 'Training',
        component: () => import('../views/TrainingView.vue'),
        meta: { title: '安全培训' }
      },
      {
        path: 'statistics',
        name: 'Statistics',
        component: () => import('../views/StatisticsView.vue'),
        meta: { title: '统计分析' }
      },
      {
        path: 'logs',
        name: 'Logs',
        component: () => import('../views/LogView.vue'),
        meta: { title: '操作日志' }
      },
      {
        path: 'profile',
        name: 'Profile',
        component: () => import('../views/ProfileView.vue'),
        meta: { title: '个人中心' }
      },
      // ===== 管理模块 =====
      {
        path: 'users',
        name: 'Users',
        component: () => import('../views/UserManageView.vue'),
        meta: { title: '用户管理' }
      },
      {
        path: 'safety-points',
        name: 'SafetyPoints',
        component: () => import('../views/SafetyPointManageView.vue'),
        meta: { title: '点位管理' }
      },
      {
        path: 'settings',
        name: 'Settings',
        component: () => import('../views/SystemSettingsView.vue'),
        meta: { title: '系统设置' }
      }
    ]
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

// 路由守卫
router.beforeEach((to, _from, next) => {
  const token = localStorage.getItem('token')
  if (to.meta.requiresAuth !== false && !token) {
    next('/login')
  } else {
    next()
  }
})

export default router
