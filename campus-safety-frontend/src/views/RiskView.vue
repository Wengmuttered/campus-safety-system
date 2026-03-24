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
      <!-- 事件趋势 ECharts -->
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
        <v-chart class="chart" :option="trendChartOption" autoresize />
      </el-card>

      <!-- 区域风险排名 -->
      <el-card>
        <template #header>
          <div style="display:flex;justify-content:space-between;align-items:center">
            <span class="section-title">🗺️ 区域风险排名</span>
            <el-button size="small" type="primary" @click="loadPrediction" :loading="predLoading">
              <el-icon><Refresh /></el-icon> AI预测
            </el-button>
          </div>
        </template>
        <v-chart class="chart" :option="riskBarOption" autoresize />
      </el-card>

      <!-- 事件类型分布 ECharts -->
      <el-card>
        <template #header><span class="section-title">📋 事件类型分布</span></template>
        <v-chart class="chart" :option="typePieOption" autoresize />
      </el-card>

      <!-- 时段分布 ECharts -->
      <el-card>
        <template #header><span class="section-title">🕐 事件时段分布</span></template>
        <v-chart class="chart" :option="hourBarOption" autoresize />
      </el-card>

      <!-- AI 建议 -->
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
import { use } from 'echarts/core'
import { CanvasRenderer } from 'echarts/renderers'
import { BarChart, PieChart, LineChart } from 'echarts/charts'
import {
  TitleComponent, TooltipComponent, LegendComponent, GridComponent
} from 'echarts/components'
import VChart from 'vue-echarts'
import { aiApi } from '../api/ai'

use([CanvasRenderer, BarChart, PieChart, LineChart, TitleComponent, TooltipComponent, LegendComponent, GridComponent])

const predLoading = ref(false)
const analysisDays = ref(90)
const totalEvents = ref(0)

const riskSummary = ref([
  { label: '高风险区域', count: 0, color: 'var(--gradient-danger)' },
  { label: '中风险区域', count: 0, color: 'var(--gradient-warning)' },
  { label: '低风险区域', count: 0, color: 'var(--gradient-success)' },
  { label: '分析事件数', count: 0, color: 'var(--gradient-primary)' }
])

const monthlyTrend = ref<Record<string, number>>({})
const riskAreas = ref<any[]>([])
const typeDistribution = ref<Record<string, number>>({})
const hourlyDistribution = ref<Record<string, number>>({})
const aiInsights = ref<any[]>([])

const eventTypeMap: Record<string, string> = {
  FIRE: '火灾', EARTHQUAKE: '地震', FLOOD: '洪水',
  CHEMICAL_LEAK: '化学泄漏', POWER_OUTAGE: '停电',
  VIOLENCE: '暴力事件', MEDICAL: '医疗急救',
  TRAFFIC: '交通事故', THEFT: '盗窃', OTHER: '其他'
}

// 事件趋势折线图
const trendChartOption = computed(() => {
  const months = Object.keys(monthlyTrend.value).map(m => m.slice(5))
  const values = Object.values(monthlyTrend.value) as number[]
  return {
    tooltip: { trigger: 'axis' },
    grid: { left: '8%', right: '5%', top: '8%', bottom: '15%' },
    xAxis: { type: 'category', data: months, axisLabel: { color: '#a0aec0' }, axisLine: { lineStyle: { color: '#2d3748' } } },
    yAxis: { type: 'value', axisLabel: { color: '#a0aec0' }, splitLine: { lineStyle: { color: '#2d3748' } } },
    series: [{
      data: values, type: 'line', smooth: true,
      areaStyle: {
        color: { type: 'linear', x: 0, y: 0, x2: 0, y2: 1,
          colorStops: [{ offset: 0, color: 'rgba(66,153,225,0.4)' }, { offset: 1, color: 'rgba(66,153,225,0.05)' }] }
      },
      lineStyle: { color: '#4299e1', width: 3 }, itemStyle: { color: '#4299e1' }
    }]
  }
})

// 区域风险横向条形图
const riskBarOption = computed(() => {
  const names = riskAreas.value.map(a => a.name).reverse()
  const values = riskAreas.value.map(a => a.risk).reverse()
  return {
    tooltip: { trigger: 'axis', formatter: '{b}: {c}%' },
    grid: { left: '25%', right: '10%', top: '5%', bottom: '5%' },
    xAxis: { type: 'value', max: 100, axisLabel: { color: '#a0aec0', formatter: '{value}%' }, splitLine: { lineStyle: { color: '#2d3748' } } },
    yAxis: { type: 'category', data: names, axisLabel: { color: '#a0aec0' } },
    series: [{
      type: 'bar', data: values.map(v => ({
        value: v,
        itemStyle: { color: v >= 70 ? '#e53e3e' : v >= 40 ? '#ed8936' : '#38a169', borderRadius: [0, 4, 4, 0] }
      }))
    }]
  }
})

// 事件类型饼图
const typePieOption = computed(() => {
  const data = Object.entries(typeDistribution.value).map(([type, count]) => ({
    name: eventTypeMap[type] || type, value: count
  }))
  return {
    tooltip: { trigger: 'item', formatter: '{b}: {c}起 ({d}%)' },
    legend: { orient: 'vertical', right: '5%', top: 'center', textStyle: { color: '#a0aec0', fontSize: 12 } },
    color: ['#e53e3e', '#ed8936', '#d69e2e', '#38a169', '#4299e1', '#9f7aea', '#ed64a6', '#a0aec0', '#319795', '#805ad5'],
    series: [{
      type: 'pie', radius: ['35%', '65%'], center: ['35%', '50%'],
      label: { show: false },
      emphasis: { label: { show: true, fontSize: 14, fontWeight: 'bold', color: '#fff' } },
      data
    }]
  }
})

// 时段柱状图
const hourBarOption = computed(() => {
  const hours = Array.from({ length: 24 }, (_, i) => `${i}时`)
  const values = Array.from({ length: 24 }, (_, i) => hourlyDistribution.value[String(i)] || 0)
  return {
    tooltip: { trigger: 'axis', formatter: '{b}: {c}起' },
    grid: { left: '8%', right: '5%', top: '8%', bottom: '15%' },
    xAxis: { type: 'category', data: hours, axisLabel: { color: '#a0aec0', fontSize: 10, interval: 3 }, axisLine: { lineStyle: { color: '#2d3748' } } },
    yAxis: { type: 'value', axisLabel: { color: '#a0aec0' }, splitLine: { lineStyle: { color: '#2d3748' } } },
    series: [{
      type: 'bar', data: values,
      itemStyle: {
        color: { type: 'linear', x: 0, y: 0, x2: 0, y2: 1,
          colorStops: [{ offset: 0, color: '#ed8936' }, { offset: 1, color: '#4299e1' }] },
        borderRadius: [3, 3, 0, 0]
      }
    }]
  }
})

function insightColor(level: string) {
  return { CAUTION: '#e53e3e', WARNING: '#d69e2e', IMPORTANT: '#4299e1', TIP: '#38a169', NOTE: '#38a169' }[level] || '#a0aec0'
}
function insightTag(level: string): any {
  return { CAUTION: 'danger', WARNING: 'warning', IMPORTANT: '', TIP: 'success', NOTE: 'info' }[level] || 'info'
}

async function loadPrediction() {
  predLoading.value = true
  try {
    const res: any = await aiApi.predictRisk()
    if (res.code === 200) {
      const data = res.data
      riskAreas.value = data.risk_areas.map((a: any) => ({
        name: a.name, risk: a.risk_score, type: a.main_risk_type, suggestion: a.suggestion
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
  } finally { predLoading.value = false }
}

async function loadAnalysis() {
  try {
    const res: any = await aiApi.analyzeEvents(analysisDays.value)
    if (res.code === 200) {
      const data = res.data
      totalEvents.value = data.total_events
      monthlyTrend.value = data.monthly_trend || {}
      typeDistribution.value = data.type_distribution || {}
      hourlyDistribution.value = data.hourly_distribution || {}
      riskSummary.value[3].count = data.total_events
      if (data.insights && data.insights.length > 0) aiInsights.value = data.insights
    }
  } catch {
    monthlyTrend.value = { '2025-10': 12, '2025-11': 18, '2025-12': 24, '2026-01': 14, '2026-02': 32, '2026-03': 10 }
    totalEvents.value = 110
    typeDistribution.value = { FIRE: 25, MEDICAL: 20, THEFT: 18, CHEMICAL_LEAK: 12, POWER_OUTAGE: 15, TRAFFIC: 10, OTHER: 10 }
    hourlyDistribution.value = { '0': 2, '1': 1, '2': 1, '6': 5, '7': 8, '8': 12, '9': 10, '10': 8, '11': 7, '12': 14, '13': 9, '14': 6, '15': 5, '16': 4, '17': 8, '18': 11, '19': 9, '20': 7, '21': 6, '22': 4, '23': 3 }
  }
}

onMounted(() => { loadAnalysis(); loadPrediction() })
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
.chart { height: 280px; }

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
