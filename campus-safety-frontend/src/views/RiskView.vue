<template>
  <div class="risk-page fade-in-up">
    <el-card class="risk-header-card">
      <div class="risk-overview">
        <div class="risk-item" v-for="r in riskSummary" :key="r.label">
          <div class="risk-circle" :style="{ background: r.color }">
            <span class="risk-count">{{ r.count }}</span>
          </div>
          <span class="risk-label">{{ r.label }}</span>
        </div>
      </div>
    </el-card>

    <div class="risk-grid">
      <el-card>
        <template #header>
          <div style="display:flex;justify-content:space-between;align-items:center">
            <span class="section-title">📊 事件趋势分析</span>
            <el-select v-model="analysisDays" size="small" style="width:120px" @change="loadAnalysis">
              <el-option :value="30" label="近30天" />
              <el-option :value="90" label="近90天" />
              <el-option :value="180" label="近半年" />
              <el-option :value="365" label="近一年" />
            </el-select>
          </div>
        </template>
        <div class="chart-placeholder">
          <div class="trend-bars">
            <div v-for="(item, i) in trendData" :key="i" class="trend-bar-group">
              <div class="trend-bar" :style="{ height: item.height + '%', background: item.color }">
                <span class="bar-value" v-if="item.count > 0">{{ item.count }}</span>
              </div>
              <span class="trend-label">{{ item.month }}</span>
            </div>
          </div>
          <p class="chart-note">月度事件统计趋势（共{{ totalEvents }}起）</p>
        </div>
      </el-card>

      <el-card>
        <template #header>
          <div style="display:flex;justify-content:space-between;align-items:center">
            <span class="section-title">🗺️ 区域风险排名</span>
            <el-button size="small" type="primary" @click="loadPrediction" :loading="predLoading">
              <el-icon><Refresh /></el-icon> AI预测
            </el-button>
          </div>
        </template>
        <div class="heatmap-legend">
          <div class="legend-item" v-for="l in heatmapLegend" :key="l.label">
            <span class="legend-dot" :style="{ background: l.color }"></span>
            {{ l.label }}
          </div>
        </div>
        <div class="area-list">
          <div class="area-item" v-for="a in riskAreas" :key="a.name">
            <span class="area-name">{{ a.name }}</span>
            <div class="area-bar-bg">
              <div class="area-bar" :style="{ width: a.risk + '%', background: riskColor(a.risk) }"></div>
            </div>
            <span class="area-risk" :style="{ color: riskColor(a.risk) }">{{ a.risk }}%</span>
          </div>
        </div>
      </el-card>

      <!-- 事件类型分布 -->
      <el-card>
        <template #header><span class="section-title">📋 事件类型分布</span></template>
        <div class="type-distribution">
          <div class="type-item" v-for="(count, type) in typeDistribution" :key="type">
            <div class="type-bar-row">
              <span class="type-name">{{ eventTypeMap[type as string] || type }}</span>
              <span class="type-count">{{ count }}起</span>
            </div>
            <div class="type-bar-bg">
              <div class="type-bar" :style="{ width: (count / maxTypeCount * 100) + '%' }"></div>
            </div>
          </div>
        </div>
      </el-card>

      <!-- 高发时段 -->
      <el-card>
        <template #header><span class="section-title">🕐 事件时段分布</span></template>
        <div class="hour-chart">
          <div v-for="h in 24" :key="h" class="hour-bar-group">
            <div class="hour-bar" :style="{ height: hourHeight(h - 1) + '%' }"></div>
            <span class="hour-label" v-if="(h - 1) % 4 === 0">{{ h - 1 }}时</span>
          </div>
        </div>
      </el-card>

      <el-card class="full-width">
        <template #header><span class="section-title">🔍 AI 智能分析建议</span></template>
        <div class="ai-insights">
          <div class="insight-item" v-for="(insight, i) in aiInsights" :key="i">
            <el-icon :size="20" :color="insightColor(insight.level)"><Warning /></el-icon>
            <div class="insight-content">
              <span class="insight-title">{{ insight.title }}</span>
              <span class="insight-desc">{{ insight.description }}</span>
            </div>
            <el-tag :type="insightTag(insight.level)" size="small">{{ insight.level }}</el-tag>
          </div>
          <div v-if="aiInsights.length === 0" class="empty-insights">
            <p>点击上方"AI预测"按钮获取智能分析建议</p>
          </div>
        </div>
      </el-card>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { aiApi } from '../api/ai'

const predLoading = ref(false)
const analysisDays = ref(90)
const totalEvents = ref(0)

const riskSummary = ref([
  { label: '高风险区域', count: 0, color: 'var(--gradient-danger)' },
  { label: '中风险区域', count: 0, color: 'var(--gradient-warning)' },
  { label: '低风险区域', count: 0, color: 'var(--gradient-success)' },
  { label: '分析事件数', count: 0, color: 'var(--gradient-primary)' }
])

const trendData = ref<any[]>([])
const riskAreas = ref<any[]>([])
const typeDistribution = ref<Record<string, number>>({})
const hourlyDistribution = ref<Record<string, number>>({})
const aiInsights = ref<any[]>([])

const eventTypeMap: Record<string, string> = {
  FIRE: '🔥 火灾', EARTHQUAKE: '🌍 地震', FLOOD: '🌊 洪水',
  CHEMICAL_LEAK: '☣️ 化学品泄漏', POWER_OUTAGE: '💡 停电',
  VIOLENCE: '⚠️ 暴力事件', MEDICAL: '🏥 医疗急救',
  TRAFFIC: '🚗 交通事故', THEFT: '🔓 盗窃', OTHER: '📋 其他'
}

const heatmapLegend = [
  { label: '高风险 (≥70)', color: '#e53e3e' },
  { label: '中风险 (40-70)', color: '#d69e2e' },
  { label: '低风险 (<40)', color: '#38a169' }
]

const maxTypeCount = computed(() => {
  const vals = Object.values(typeDistribution.value)
  return vals.length > 0 ? Math.max(...vals) : 1
})

function riskColor(risk: number) {
  if (risk >= 70) return '#e53e3e'
  if (risk >= 40) return '#d69e2e'
  return '#38a169'
}

function trendColor(count: number, max: number) {
  const ratio = count / (max || 1)
  if (ratio >= 0.7) return '#e53e3e'
  if (ratio >= 0.4) return '#d69e2e'
  return '#38a169'
}

function hourHeight(h: number) {
  const count = hourlyDistribution.value[String(h)] || 0
  const max = Math.max(...Object.values(hourlyDistribution.value).map(Number), 1)
  return (count / max) * 100
}

function insightColor(level: string) {
  const m: Record<string, string> = { CAUTION: '#e53e3e', WARNING: '#d69e2e', IMPORTANT: '#4299e1', TIP: '#38a169', NOTE: '#38a169' }
  return m[level] || '#a0aec0'
}

function insightTag(level: string): any {
  const m: Record<string, string> = { CAUTION: 'danger', WARNING: 'warning', IMPORTANT: '', TIP: 'success', NOTE: 'info' }
  return m[level] || 'info'
}

async function loadPrediction() {
  predLoading.value = true
  try {
    const res: any = await aiApi.predictRisk()
    if (res.code === 200) {
      const data = res.data
      riskAreas.value = data.risk_areas.map((a: any) => ({
        name: a.name,
        risk: a.risk_score,
        type: a.main_risk_type,
        suggestion: a.suggestion
      }))
      aiInsights.value = data.risk_areas
        .filter((a: any) => a.risk_level !== 'LOW')
        .map((a: any) => ({
          level: a.risk_level === 'HIGH' ? 'CAUTION' : 'WARNING',
          title: `${a.name} — ${a.risk_level === 'HIGH' ? '高风险' : '中风险'}`,
          description: a.suggestion
        }))
      riskSummary.value[0].count = data.summary.high_risk_count
      riskSummary.value[1].count = data.summary.medium_risk_count
      riskSummary.value[2].count = data.summary.low_risk_count
    }
  } catch {
    // 使用默认模拟数据
    riskAreas.value = [
      { name: '化学实验楼', risk: 85 }, { name: '学生宿舍1栋', risk: 75 },
      { name: '学生食堂', risk: 60 }, { name: '体育馆', risk: 35 },
      { name: '图书馆', risk: 25 }, { name: '行政楼', risk: 15 }
    ]
    riskSummary.value = [
      { label: '高风险区域', count: 2, color: 'var(--gradient-danger)' },
      { label: '中风险区域', count: 2, color: 'var(--gradient-warning)' },
      { label: '低风险区域', count: 6, color: 'var(--gradient-success)' },
      { label: '分析事件数', count: 300, color: 'var(--gradient-primary)' }
    ]
  } finally {
    predLoading.value = false
  }
}

async function loadAnalysis() {
  try {
    const res: any = await aiApi.analyzeEvents(analysisDays.value)
    if (res.code === 200) {
      const data = res.data
      totalEvents.value = data.total_events
      typeDistribution.value = data.type_distribution || {}
      hourlyDistribution.value = data.hourly_distribution || {}
      riskSummary.value[3].count = data.total_events

      // 趋势数据
      const trend = data.monthly_trend || {}
      const maxCount = Math.max(...Object.values(trend).map(Number), 1)
      trendData.value = Object.entries(trend).map(([month, count]) => ({
        month: month.slice(5),
        count,
        height: (Number(count) / maxCount) * 100,
        color: trendColor(Number(count), maxCount)
      }))

      // AI 建议
      if (data.insights && data.insights.length > 0) {
        aiInsights.value = data.insights
      }
    }
  } catch {
    // 使用默认
    trendData.value = [
      { month: '10月', count: 12, height: 30, color: '#38a169' },
      { month: '11月', count: 18, height: 45, color: '#d69e2e' },
      { month: '12月', count: 24, height: 60, color: '#d69e2e' },
      { month: '1月', count: 14, height: 35, color: '#38a169' },
      { month: '2月', count: 32, height: 80, color: '#e53e3e' },
      { month: '3月', count: 10, height: 25, color: '#38a169' }
    ]
    totalEvents.value = 110
    typeDistribution.value = { FIRE: 25, MEDICAL: 20, THEFT: 18, CHEMICAL_LEAK: 12, POWER_OUTAGE: 15, TRAFFIC: 10, OTHER: 10 }
  }
}

onMounted(() => {
  loadAnalysis()
  loadPrediction()
})
</script>

<style scoped>
.risk-overview { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; }
.risk-item { display: flex; flex-direction: column; align-items: center; gap: 8px; }
.risk-circle { width: 72px; height: 72px; border-radius: 50%; display: flex; align-items: center; justify-content: center; }
.risk-count { font-size: 24px; font-weight: 700; color: #fff; }
.risk-label { font-size: 13px; color: var(--text-secondary); }
.risk-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-top: 20px; }
.full-width { grid-column: 1 / -1; }
.section-title { font-weight: 600; color: var(--text-primary); }

/* 趋势图 */
.chart-placeholder { padding: 20px 0; }
.trend-bars { display: flex; align-items: flex-end; gap: 12px; height: 200px; padding: 0 20px; }
.trend-bar-group { flex: 1; display: flex; flex-direction: column; align-items: center; gap: 8px; }
.trend-bar { width: 100%; border-radius: 6px 6px 0 0; transition: height 0.8s ease; min-height: 4px; position: relative; }
.bar-value { position: absolute; top: -20px; left: 50%; transform: translateX(-50%); font-size: 11px; color: var(--text-secondary); }
.trend-label { font-size: 12px; color: var(--text-secondary); }
.chart-note { text-align: center; margin-top: 16px; font-size: 12px; color: var(--text-secondary); }

/* 热力图 */
.heatmap-legend { display: flex; gap: 16px; margin-bottom: 16px; }
.legend-item { display: flex; align-items: center; gap: 6px; font-size: 13px; color: var(--text-secondary); }
.legend-dot { width: 10px; height: 10px; border-radius: 50%; }
.area-list { display: flex; flex-direction: column; gap: 12px; }
.area-item { display: flex; align-items: center; gap: 12px; }
.area-name { width: 120px; font-size: 13px; color: var(--text-primary); flex-shrink: 0; }
.area-bar-bg { flex: 1; height: 8px; background: rgba(255,255,255,0.06); border-radius: 4px; overflow: hidden; }
.area-bar { height: 100%; border-radius: 4px; transition: width 1s ease; }
.area-risk { width: 44px; font-size: 13px; font-weight: 600; text-align: right; }

/* 事件类型分布 */
.type-distribution { display: flex; flex-direction: column; gap: 14px; }
.type-item { display: flex; flex-direction: column; gap: 4px; }
.type-bar-row { display: flex; justify-content: space-between; }
.type-name { font-size: 13px; color: var(--text-primary); }
.type-count { font-size: 12px; color: var(--text-secondary); }
.type-bar-bg { height: 6px; background: rgba(255,255,255,0.06); border-radius: 3px; overflow: hidden; }
.type-bar { height: 100%; border-radius: 3px; background: linear-gradient(90deg, #4299e1, #63b3ed); transition: width 0.8s ease; }

/* 时段分布 */
.hour-chart { display: flex; align-items: flex-end; gap: 4px; height: 160px; padding: 0 8px; }
.hour-bar-group { flex: 1; display: flex; flex-direction: column; align-items: center; gap: 4px; }
.hour-bar { width: 100%; border-radius: 3px 3px 0 0; background: linear-gradient(180deg, #ed8936, #4299e1); transition: height 0.8s ease; min-height: 2px; }
.hour-label { font-size: 10px; color: var(--text-secondary); }

/* AI分析 */
.ai-insights { display: flex; flex-direction: column; gap: 16px; }
.insight-item { display: flex; align-items: center; gap: 12px; padding: 14px; border-radius: 10px; background: rgba(255,255,255,0.03); }
.insight-content { flex: 1; display: flex; flex-direction: column; }
.insight-title { font-size: 14px; font-weight: 600; color: var(--text-primary); }
.insight-desc { font-size: 12px; color: var(--text-secondary); margin-top: 2px; }
.empty-insights { text-align: center; padding: 24px; color: var(--text-secondary); }

@media (max-width: 1200px) {
  .risk-overview { grid-template-columns: repeat(2, 1fr); }
  .risk-grid { grid-template-columns: 1fr; }
}
</style>
