<template>
  <el-container class="main-layout">
    <!-- 侧边栏 -->
    <el-aside :width="isCollapse ? '64px' : '220px'" class="sidebar">
      <div class="logo" @click="isCollapse = !isCollapse">
        <el-icon :size="28" color="#e53e3e"><Warning /></el-icon>
        <span v-if="!isCollapse" class="logo-text">应急安全平台</span>
      </div>

      <el-menu
        :default-active="route.path"
        :collapse="isCollapse"
        background-color="#142030"
        text-color="#a0aec0"
        active-text-color="#63b3ed"
        router
      >
        <el-menu-item index="/dashboard">
          <el-icon><DataAnalysis /></el-icon>
          <span>控制台</span>
        </el-menu-item>
        <el-menu-item index="/map">
          <el-icon><MapLocation /></el-icon>
          <span>校园地图</span>
        </el-menu-item>
        <el-menu-item index="/alert">
          <el-icon><Bell /></el-icon>
          <span>一键求助</span>
        </el-menu-item>
        <el-menu-item index="/events">
          <el-icon><Document /></el-icon>
          <span>事件管理</span>
        </el-menu-item>
        <el-menu-item index="/evacuation">
          <el-icon><Guide /></el-icon>
          <span>疏散导航</span>
        </el-menu-item>
        <el-menu-item index="/drill">
          <el-icon><VideoCamera /></el-icon>
          <span>应急演练</span>
        </el-menu-item>
        <el-menu-item index="/risk">
          <el-icon><TrendCharts /></el-icon>
          <span>风险分析</span>
        </el-menu-item>
      </el-menu>
    </el-aside>

    <!-- 主内容区 -->
    <el-container>
      <!-- 顶栏 -->
      <el-header class="topbar">
        <div class="topbar-left">
          <span class="page-title">{{ route.meta.title || '控制台' }}</span>
        </div>
        <div class="topbar-right">
          <el-badge :value="alertCount" :hidden="alertCount === 0" class="alert-badge">
            <el-icon :size="20" class="topbar-icon"><Bell /></el-icon>
          </el-badge>
          <el-dropdown trigger="click" @command="handleCommand">
            <div class="user-info">
              <el-avatar :size="32" class="avatar">
                {{ userStore.realName?.charAt(0) || 'U' }}
              </el-avatar>
              <span class="user-name">{{ userStore.realName || userStore.username }}</span>
            </div>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item disabled>
                  角色：{{ roleLabel }}
                </el-dropdown-item>
                <el-dropdown-item divided command="logout">
                  <el-icon><SwitchButton /></el-icon>退出登录
                </el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </div>
      </el-header>

      <!-- 页面内容 -->
      <el-main class="main-content">
        <router-view />
      </el-main>
    </el-container>
  </el-container>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useUserStore } from '../stores/user'

const route = useRoute()
const router = useRouter()
const userStore = useUserStore()
const isCollapse = ref(false)
const alertCount = ref(0)

const roleLabel = computed(() => {
  const map: Record<string, string> = {
    ADMIN: '管理员', SECURITY: '安保人员', TEACHER: '教师', STUDENT: '学生'
  }
  return map[userStore.role] || userStore.role
})

function handleCommand(cmd: string) {
  if (cmd === 'logout') {
    userStore.logout()
    router.push('/login')
  }
}
</script>

<style scoped>
.main-layout {
  height: 100vh;
  overflow: hidden;
}

.sidebar {
  background: var(--bg-sidebar);
  transition: width 0.3s;
  overflow-x: hidden;
  border-right: 1px solid var(--border-color);
}

.logo {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 16px 20px;
  cursor: pointer;
  border-bottom: 1px solid var(--border-color);
  height: 60px;
}

.logo-text {
  font-size: 16px;
  font-weight: 700;
  background: linear-gradient(135deg, #e53e3e, #ed8936);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  white-space: nowrap;
}

.topbar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  background: var(--bg-card);
  border-bottom: 1px solid var(--border-color);
  padding: 0 24px;
  height: 60px !important;
}

.page-title {
  font-size: 18px;
  font-weight: 600;
  color: var(--text-primary);
}

.topbar-right {
  display: flex;
  align-items: center;
  gap: 20px;
}

.topbar-icon {
  color: var(--text-secondary);
  cursor: pointer;
  transition: color 0.2s;
}

.topbar-icon:hover {
  color: var(--text-primary);
}

.user-info {
  display: flex;
  align-items: center;
  gap: 8px;
  cursor: pointer;
}

.avatar {
  background: var(--gradient-primary);
  color: white;
  font-weight: 600;
}

.user-name {
  color: var(--text-primary);
  font-size: 14px;
}

.main-content {
  background: var(--bg-dark);
  overflow-y: auto;
  padding: 24px;
}

.el-menu-item {
  border-radius: 8px;
  margin: 4px 8px;
}

.el-menu-item.is-active {
  background: rgba(99, 179, 237, 0.1) !important;
}

.alert-badge :deep(.el-badge__content) {
  background: var(--accent);
}
</style>
