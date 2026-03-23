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
