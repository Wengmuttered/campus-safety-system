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
        <template #header><span class="section-title">📊 风险趋势分析</span></template>
        <div class="chart-placeholder">
          <div class="trend-bars">
            <div v-for="(item, i) in trendData" :key="i" class="trend-bar-group">
              <div class="trend-bar" :style="{ height: item.height + '%', background: item.color }"></div>
              <span class="trend-label">{{ item.month }}</span>
            </div>
          </div>
          <p class="chart-note">近6个月事件统计趋势</p>
        </div>
      </el-card>

      <el-card>
        <template #header><span class="section-title">🗺️ 风险热力区域</span></template>
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

      <el-card class="full-width">
        <template #header><span class="section-title">🔍 AI预测分析</span></template>
        <div class="ai-insights">
          <div class="insight-item" v-for="(insight, i) in aiInsights" :key="i">
            <el-icon :size="20" :color="insight.color"><Warning /></el-icon>
            <div class="insight-content">
              <span class="insight-title">{{ insight.title }}</span>
              <span class="insight-desc">{{ insight.desc }}</span>
            </div>
            <el-tag :type="insight.tag" size="small">{{ insight.level }}</el-tag>
          </div>
        </div>
      </el-card>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'

const riskSummary = ref([
  { label: '高风险区域', count: 2, color: 'var(--gradient-danger)' },
  { label: '中风险区域', count: 3, color: 'var(--gradient-warning)' },
  { label: '低风险区域', count: 8, color: 'var(--gradient-success)' },
  { label: '本月事件', count: 5, color: 'var(--gradient-primary)' }
])

const trendData = ref([
  { month: '10月', height: 30, color: '#38a169' },
  { month: '11月', height: 45, color: '#d69e2e' },
  { month: '12月', height: 60, color: '#d69e2e' },
  { month: '1月', height: 35, color: '#38a169' },
  { month: '2月', height: 80, color: '#e53e3e' },
  { month: '3月', height: 25, color: '#38a169' }
])

const heatmapLegend = [
  { label: '高风险', color: '#e53e3e' },
  { label: '中风险', color: '#d69e2e' },
  { label: '低风险', color: '#38a169' }
]

const riskAreas = ref([
  { name: '学生宿舍区', risk: 75 },
  { name: '实验楼化学实验室', risk: 85 },
  { name: '食堂厨房', risk: 60 },
  { name: '图书馆', risk: 25 },
  { name: '体育馆', risk: 35 },
  { name: '行政楼', risk: 15 }
])

const aiInsights = ref([
  { title: '化学实验室火灾风险升高', desc: '近期化学实验课增多，建议增加消防巡检频次', color: '#e53e3e', tag: 'danger' as const, level: '高风险' },
  { title: '宿舍区用电安全隐患', desc: '冬季大功率电器使用增多，建议加强用电安全宣传', color: '#d69e2e', tag: 'warning' as const, level: '中风险' },
  { title: '台风季节预警', desc: '海南地区即将进入台风多发期，建议提前做好防台准备', color: '#d69e2e', tag: 'warning' as const, level: '中风险' },
  { title: '整体安全形势平稳', desc: '本月事件数较上月下降37.5%，各项安全指标良好', color: '#38a169', tag: 'success' as const, level: '正常' }
])

function riskColor(risk: number) {
  if (risk >= 70) return '#e53e3e'
  if (risk >= 40) return '#d69e2e'
  return '#38a169'
}
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
.trend-bars { display: flex; align-items: flex-end; gap: 16px; height: 200px; padding: 0 20px; }
.trend-bar-group { flex: 1; display: flex; flex-direction: column; align-items: center; gap: 8px; }
.trend-bar { width: 100%; border-radius: 6px 6px 0 0; transition: height 0.5s ease; min-height: 4px; }
.trend-label { font-size: 12px; color: var(--text-secondary); }
.chart-note { text-align: center; margin-top: 16px; font-size: 12px; color: var(--text-secondary); }

/* 热力图 */
.heatmap-legend { display: flex; gap: 16px; margin-bottom: 16px; }
.legend-item { display: flex; align-items: center; gap: 6px; font-size: 13px; color: var(--text-secondary); }
.legend-dot { width: 10px; height: 10px; border-radius: 50%; }
.area-list { display: flex; flex-direction: column; gap: 12px; }
.area-item { display: flex; align-items: center; gap: 12px; }
.area-name { width: 140px; font-size: 13px; color: var(--text-primary); }
.area-bar-bg { flex: 1; height: 8px; background: rgba(255,255,255,0.06); border-radius: 4px; overflow: hidden; }
.area-bar { height: 100%; border-radius: 4px; transition: width 1s ease; }
.area-risk { width: 40px; font-size: 13px; font-weight: 600; text-align: right; }

/* AI分析 */
.ai-insights { display: flex; flex-direction: column; gap: 16px; }
.insight-item { display: flex; align-items: center; gap: 12px; padding: 14px; border-radius: 10px; background: rgba(255,255,255,0.03); }
.insight-content { flex: 1; display: flex; flex-direction: column; }
.insight-title { font-size: 14px; font-weight: 600; color: var(--text-primary); }
.insight-desc { font-size: 12px; color: var(--text-secondary); margin-top: 2px; }
</style>
