<template>
  <div class="dashboard fade-in-up">
    <!-- 统计卡片 -->
    <div class="stat-cards">
      <div class="stat-card" v-for="item in statCards" :key="item.label"
           :style="{ background: item.gradient }">
        <div class="stat-icon">
          <el-icon :size="32"><component :is="item.icon" /></el-icon>
        </div>
        <div class="stat-info">
          <span class="stat-value">{{ item.value }}</span>
          <span class="stat-label">{{ item.label }}</span>
        </div>
      </div>
    </div>

    <!-- 快捷操作 -->
    <div class="section-row">
      <el-card class="quick-actions">
        <template #header>
          <span class="section-title">快捷操作</span>
        </template>
        <div class="action-grid">
          <div class="action-item" @click="$router.push('/alert')">
            <div class="action-icon sos-pulse">
              <el-icon :size="28" color="#fff"><Bell /></el-icon>
            </div>
            <span>一键求助</span>
          </div>
          <div class="action-item" @click="$router.push('/map')">
            <div class="action-icon" style="background: var(--gradient-primary)">
              <el-icon :size="28" color="#fff"><MapLocation /></el-icon>
            </div>
            <span>校园地图</span>
          </div>
          <div class="action-item" @click="$router.push('/events')">
            <div class="action-icon" style="background: var(--gradient-warning)">
              <el-icon :size="28" color="#fff"><Document /></el-icon>
            </div>
            <span>上报事件</span>
          </div>
          <div class="action-item" @click="$router.push('/evacuation')">
            <div class="action-icon" style="background: var(--gradient-success)">
              <el-icon :size="28" color="#fff"><Guide /></el-icon>
            </div>
            <span>疏散导航</span>
          </div>
        </div>
      </el-card>

      <!-- 最近报警 -->
      <el-card class="recent-alerts">
        <template #header>
          <span class="section-title">最近报警</span>
        </template>
        <div v-if="recentAlerts.length === 0" class="empty-state">
          <el-icon :size="48" color="#4a5568"><CircleCheck /></el-icon>
          <p>当前无待处理报警</p>
        </div>
        <div v-else class="alert-list">
          <div class="alert-item" v-for="alert in recentAlerts" :key="alert.id">
            <div class="alert-dot" :class="alert.status"></div>
            <div class="alert-info">
              <span class="alert-type">{{ alertTypeMap[alert.alertType] || alert.alertType }}</span>
              <span class="alert-time">{{ alert.createdAt }}</span>
            </div>
            <el-tag :type="statusTagType(alert.status)" size="small">
              {{ statusMap[alert.status] || alert.status }}
            </el-tag>
          </div>
        </div>
      </el-card>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { dashboardApi, alertApi } from '../api'

const stats = ref<any>({})
const recentAlerts = ref<any[]>([])

const alertTypeMap: Record<string, string> = {
  SOS: '紧急求助', FIRE_ALARM: '火警', MEDICAL: '医疗救助', SECURITY: '安全求助'
}

const statusMap: Record<string, string> = {
  PENDING: '待处理', DISPATCHED: '已派遣', IN_PROGRESS: '处理中', RESOLVED: '已解决'
}

const statCards = computed(() => [
  { label: '活跃事件', value: stats.value.activeEvents ?? 0, icon: 'Warning', gradient: 'var(--gradient-danger)' },
  { label: '待处理报警', value: stats.value.pendingAlerts ?? 0, icon: 'Bell', gradient: 'var(--gradient-warning)' },
  { label: '安全点位', value: stats.value.totalSafetyPoints ?? 0, icon: 'MapLocation', gradient: 'var(--gradient-primary)' },
  { label: '建筑物', value: stats.value.totalBuildings ?? 0, icon: 'OfficeBuilding', gradient: 'var(--gradient-success)' }
])

function statusTagType(status: string) {
  const map: Record<string, string> = {
    PENDING: 'danger', DISPATCHED: 'warning', IN_PROGRESS: '', RESOLVED: 'success'
  }
  return map[status] || 'info'
}

onMounted(async () => {
  try {
    const [statsRes, alertsRes]: any[] = await Promise.all([
      dashboardApi.getStats(),
      alertApi.getAlerts('PENDING', 0, 5)
    ])
    if (statsRes.code === 200) stats.value = statsRes.data
    if (alertsRes.code === 200) recentAlerts.value = alertsRes.data?.content || []
  } catch {
    // 使用模拟数据
    stats.value = { activeEvents: 2, pendingAlerts: 3, totalSafetyPoints: 8, totalBuildings: 6 }
  }
})
</script>

<style scoped>
.stat-cards {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
  margin-bottom: 24px;
}

.stat-card {
  padding: 24px;
  border-radius: var(--radius);
  display: flex;
  align-items: center;
  gap: 16px;
  box-shadow: var(--shadow);
  transition: transform 0.2s;
}

.stat-card:hover {
  transform: translateY(-4px);
}

.stat-icon {
  width: 56px;
  height: 56px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(255, 255, 255, 0.15);
  border-radius: 12px;
}

.stat-value {
  display: block;
  font-size: 28px;
  font-weight: 700;
  color: #fff;
}

.stat-label {
  font-size: 13px;
  color: rgba(255, 255, 255, 0.8);
}

.section-row {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 24px;
}

.section-title {
  font-weight: 600;
  color: var(--text-primary);
}

.action-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 16px;
}

.action-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 10px;
  padding: 20px;
  border-radius: 12px;
  cursor: pointer;
  transition: all 0.2s;
  background: rgba(255, 255, 255, 0.03);
}

.action-item:hover {
  background: rgba(255, 255, 255, 0.08);
  transform: translateY(-2px);
}

.action-item span {
  font-size: 13px;
  color: var(--text-secondary);
}

.action-icon {
  width: 56px;
  height: 56px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 14px;
}

.sos-pulse {
  background: var(--gradient-danger);
  animation: pulse 2s infinite;
}

.empty-state {
  padding: 40px;
  text-align: center;
  color: var(--text-secondary);
}

.empty-state p {
  margin-top: 12px;
}

.alert-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.alert-item {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 12px;
  border-radius: 8px;
  background: rgba(255, 255, 255, 0.03);
}

.alert-dot {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  flex-shrink: 0;
}

.alert-dot.PENDING { background: #e53e3e; }
.alert-dot.IN_PROGRESS { background: #d69e2e; }
.alert-dot.RESOLVED { background: #38a169; }

.alert-info {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.alert-type {
  font-size: 14px;
  color: var(--text-primary);
}

.alert-time {
  font-size: 12px;
  color: var(--text-secondary);
}

@media (max-width: 1200px) {
  .stat-cards { grid-template-columns: repeat(2, 1fr); }
  .section-row { grid-template-columns: 1fr; }
}
</style>
