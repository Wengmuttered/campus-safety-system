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

    <!-- 图表行 -->
    <div class="chart-row">
      <el-card class="chart-card">
        <template #header>
          <span class="section-title">📊 事件趋势（近6个月）</span>
        </template>
        <v-chart class="chart" :option="trendOption" autoresize />
      </el-card>
      <el-card class="chart-card">
        <template #header>
          <span class="section-title">📋 事件类型分布</span>
        </template>
        <v-chart class="chart" :option="typeOption" autoresize />
      </el-card>
    </div>

    <!-- 快捷操作 + 最近报警 -->
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
              <span class="alert-time">{{ formatTime(alert.createdAt) }}</span>
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
import { use } from 'echarts/core'
import { CanvasRenderer } from 'echarts/renderers'
import { LineChart, PieChart } from 'echarts/charts'
import {
  TitleComponent, TooltipComponent, LegendComponent,
  GridComponent
} from 'echarts/components'
import VChart from 'vue-echarts'
import { dashboardApi, alertApi } from '../api'
import { aiApi } from '../api/ai'

use([CanvasRenderer, LineChart, PieChart, TitleComponent, TooltipComponent, LegendComponent, GridComponent])

const stats = ref<any>({})
const recentAlerts = ref<any[]>([])
const trendData = ref<any>({})
const typeData = ref<any>({})

const alertTypeMap: Record<string, string> = {
  SOS: '紧急求助', FIRE_ALARM: '火警', MEDICAL: '医疗救助', SECURITY: '安全求助'
}

const statusMap: Record<string, string> = {
  PENDING: '待处理', DISPATCHED: '已派遣', IN_PROGRESS: '处理中', RESOLVED: '已解决'
}

const eventTypeMap: Record<string, string> = {
  FIRE: '火灾', EARTHQUAKE: '地震', FLOOD: '洪水', CHEMICAL_LEAK: '化学泄漏',
  POWER_OUTAGE: '停电', VIOLENCE: '暴力事件', MEDICAL: '医疗急救',
  TRAFFIC: '交通事故', THEFT: '盗窃', OTHER: '其他'
}

const statCards = computed(() => [
  { label: '活跃事件', value: stats.value.activeEvents ?? 0, icon: 'Warning', gradient: 'var(--gradient-danger)' },
  { label: '待处理报警', value: stats.value.pendingAlerts ?? 0, icon: 'Bell', gradient: 'var(--gradient-warning)' },
  { label: '安全点位', value: stats.value.totalSafetyPoints ?? 0, icon: 'MapLocation', gradient: 'var(--gradient-primary)' },
  { label: '建筑物', value: stats.value.totalBuildings ?? 0, icon: 'OfficeBuilding', gradient: 'var(--gradient-success)' }
])

// 事件趋势折线图配置
const trendOption = computed(() => {
  const months = Object.keys(trendData.value)
  const values = Object.values(trendData.value) as number[]
  return {
    tooltip: { trigger: 'axis' },
    grid: { left: '8%', right: '5%', top: '10%', bottom: '12%' },
    xAxis: {
      type: 'category',
      data: months.map(m => m.slice(5)),
      axisLabel: { color: '#a0aec0' },
      axisLine: { lineStyle: { color: '#2d3748' } }
    },
    yAxis: {
      type: 'value',
      axisLabel: { color: '#a0aec0' },
      splitLine: { lineStyle: { color: '#2d3748' } }
    },
    series: [{
      data: values,
      type: 'line',
      smooth: true,
      areaStyle: {
        color: {
          type: 'linear', x: 0, y: 0, x2: 0, y2: 1,
          colorStops: [
            { offset: 0, color: 'rgba(66,153,225,0.4)' },
            { offset: 1, color: 'rgba(66,153,225,0.05)' }
          ]
        }
      },
      lineStyle: { color: '#4299e1', width: 3 },
      itemStyle: { color: '#4299e1' }
    }]
  }
})

// 事件类型饼图配置
const typeOption = computed(() => {
  const data = Object.entries(typeData.value).map(([type, count]) => ({
    name: eventTypeMap[type] || type,
    value: count
  }))
  return {
    tooltip: { trigger: 'item', formatter: '{b}: {c}起 ({d}%)' },
    legend: {
      orient: 'vertical', right: '5%', top: 'center',
      textStyle: { color: '#a0aec0', fontSize: 12 }
    },
    color: ['#e53e3e', '#ed8936', '#d69e2e', '#38a169', '#4299e1', '#9f7aea', '#ed64a6', '#a0aec0'],
    series: [{
      type: 'pie',
      radius: ['40%', '70%'],
      center: ['35%', '50%'],
      avoidLabelOverlap: true,
      label: { show: false },
      emphasis: {
        label: { show: true, fontSize: 14, fontWeight: 'bold', color: '#fff' }
      },
      data
    }]
  }
})

function statusTagType(status: string) {
  const map: Record<string, string> = {
    PENDING: 'danger', DISPATCHED: 'warning', IN_PROGRESS: '', RESOLVED: 'success'
  }
  return map[status] || 'info'
}

function formatTime(time: string) {
  if (!time) return ''
  return time.replace('T', ' ').substring(0, 16)
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
    stats.value = { activeEvents: 2, pendingAlerts: 3, totalSafetyPoints: 8, totalBuildings: 6 }
  }

  // 加载 AI 分析数据用于图表
  try {
    const res: any = await aiApi.analyzeEvents(180)
    if (res.code === 200) {
      trendData.value = res.data?.monthly_trend || {}
      typeData.value = res.data?.type_distribution || {}
    }
  } catch {
    // 使用模拟数据
    trendData.value = { '2025-10': 12, '2025-11': 18, '2025-12': 24, '2026-01': 14, '2026-02': 32, '2026-03': 10 }
    typeData.value = { FIRE: 25, MEDICAL: 20, THEFT: 18, CHEMICAL_LEAK: 12, POWER_OUTAGE: 15, TRAFFIC: 10, OTHER: 10 }
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

.stat-card:hover { transform: translateY(-4px); }

.stat-icon {
  width: 56px; height: 56px;
  display: flex; align-items: center; justify-content: center;
  background: rgba(255, 255, 255, 0.15);
  border-radius: 12px;
}

.stat-value { display: block; font-size: 28px; font-weight: 700; color: #fff; }
.stat-label { font-size: 13px; color: rgba(255, 255, 255, 0.8); }

.chart-row {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 24px;
  margin-bottom: 24px;
}

.chart-card { height: 100%; }
.chart { height: 280px; }

.section-row {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 24px;
}

.section-title { font-weight: 600; color: var(--text-primary); }

.action-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; }
.action-item {
  display: flex; flex-direction: column; align-items: center; gap: 10px;
  padding: 20px; border-radius: 12px; cursor: pointer; transition: all 0.2s;
  background: rgba(255, 255, 255, 0.03);
}
.action-item:hover { background: rgba(255, 255, 255, 0.08); transform: translateY(-2px); }
.action-item span { font-size: 13px; color: var(--text-secondary); }
.action-icon {
  width: 56px; height: 56px;
  display: flex; align-items: center; justify-content: center;
  border-radius: 14px;
}
.sos-pulse { background: var(--gradient-danger); animation: pulse 2s infinite; }

.empty-state { padding: 40px; text-align: center; color: var(--text-secondary); }
.empty-state p { margin-top: 12px; }

.alert-list { display: flex; flex-direction: column; gap: 12px; }
.alert-item {
  display: flex; align-items: center; gap: 12px;
  padding: 12px; border-radius: 8px; background: rgba(255, 255, 255, 0.03);
}
.alert-dot { width: 8px; height: 8px; border-radius: 50%; flex-shrink: 0; }
.alert-dot.PENDING { background: #e53e3e; }
.alert-dot.IN_PROGRESS { background: #d69e2e; }
.alert-dot.RESOLVED { background: #38a169; }
.alert-info { flex: 1; display: flex; flex-direction: column; }
.alert-type { font-size: 14px; color: var(--text-primary); }
.alert-time { font-size: 12px; color: var(--text-secondary); }

@media (max-width: 1200px) {
  .stat-cards { grid-template-columns: repeat(2, 1fr); }
  .chart-row, .section-row { grid-template-columns: 1fr; }
}
</style>
