<template>
  <div class="page-container fade-in-up">
    <h2 class="page-title">📊 安全数据统计分析</h2>
    <!-- 总览卡片 -->
    <div class="overview-cards">
      <div class="ov-card" v-for="c in overviewCards" :key="c.label" :style="{background:c.bg}">
        <div class="ov-icon">{{ c.icon }}</div>
        <div class="ov-info"><span class="ov-val">{{ c.value }}</span><span class="ov-label">{{ c.label }}</span></div>
      </div>
    </div>
    <!-- 图表 -->
    <el-row :gutter="20" style="margin-top:20px">
      <el-col :span="12">
        <el-card><template #header><b>巡检任务分析</b></template>
          <div ref="inspChart" style="height:320px"></div>
        </el-card>
      </el-col>
      <el-col :span="12">
        <el-card><template #header><b>隐患级别分布</b></template>
          <div ref="hazardChart" style="height:320px"></div>
        </el-card>
      </el-col>
    </el-row>
    <el-row :gutter="20" style="margin-top:20px">
      <el-col :span="12">
        <el-card><template #header><b>物资状态概览</b></template>
          <div ref="supplyChart" style="height:320px"></div>
        </el-card>
      </el-col>
      <el-col :span="12">
        <el-card><template #header><b>安全指标雷达图</b></template>
          <div ref="radarChart" style="height:320px"></div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, nextTick } from 'vue'
import * as echarts from 'echarts'
import api from '../api'

const overviewCards = ref<any[]>([])
const inspChart = ref<HTMLElement>()
const hazardChart = ref<HTMLElement>()
const supplyChart = ref<HTMLElement>()
const radarChart = ref<HTMLElement>()

async function loadData() {
  try {
    const r: any = await api.get('/statistics/overview', { params: { campusId: 1 } })
    if (r.code === 200) {
      const d = r.data
      overviewCards.value = [
        { label: '事件总数', value: d.event?.total ?? 0, icon: '🚨', bg: 'var(--gradient-danger)' },
        { label: '巡检任务', value: d.inspection?.total ?? 0, icon: '🔍', bg: 'var(--gradient-primary)' },
        { label: '隐患跟踪', value: d.hazard?.total ?? 0, icon: '⚠️', bg: 'var(--gradient-warning)' },
        { label: '物资台账', value: d.supply?.total ?? 0, icon: '📦', bg: 'linear-gradient(135deg,#2b6cb0,#63b3ed)' },
        { label: '培训课程', value: d.training?.totalCourses ?? 0, icon: '📚', bg: 'var(--gradient-success)' },
        { label: '系统用户', value: d.user?.total ?? 0, icon: '👥', bg: 'linear-gradient(135deg,#805ad5,#b794f4)' },
      ]
      await nextTick()
      renderInspection(d.inspection)
      renderHazard(d.hazard)
      renderSupply(d.supply)
      renderRadar(d)
    }
  } catch { /**/ }
}

function renderInspection(data: any) {
  if (!inspChart.value) return
  const chart = echarts.init(inspChart.value)
  chart.setOption({
    tooltip: { trigger: 'item' },
    color: ['#a0aec0', '#ed8936', '#48bb78', '#e53e3e'],
    series: [{ type: 'pie', radius: ['40%', '70%'], padAngle: 3, itemStyle: { borderRadius: 6 },
      label: { formatter: '{b}: {c}' },
      data: [
        { value: data?.pending ?? 0, name: '待执行' },
        { value: data?.inProgress ?? 0, name: '巡检中' },
        { value: data?.completed ?? 0, name: '已完成' },
        { value: data?.abnormal ?? 0, name: '发现异常' }
      ]
    }]
  })
}

function renderHazard(data: any) {
  if (!hazardChart.value) return
  const chart = echarts.init(hazardChart.value)
  chart.setOption({
    tooltip: { trigger: 'axis' },
    xAxis: { type: 'category', data: ['一般', '较大', '重大'], axisLabel: { color: '#a0aec0' } },
    yAxis: { type: 'value', axisLabel: { color: '#a0aec0' } },
    series: [{
      type: 'bar', barWidth: 40, itemStyle: { borderRadius: [6, 6, 0, 0] },
      data: [
        { value: data?.minor ?? 0, itemStyle: { color: '#63b3ed' } },
        { value: data?.major ?? 0, itemStyle: { color: '#ed8936' } },
        { value: data?.critical ?? 0, itemStyle: { color: '#e53e3e' } }
      ]
    }]
  })
}

function renderSupply(data: any) {
  if (!supplyChart.value) return
  const chart = echarts.init(supplyChart.value)
  const normal = (data?.total ?? 0) - (data?.lowStock ?? 0) - (data?.expired ?? 0)
  chart.setOption({
    tooltip: { trigger: 'item' },
    color: ['#48bb78', '#ed8936', '#e53e3e'],
    series: [{ type: 'pie', radius: '65%',
      data: [
        { value: normal > 0 ? normal : 0, name: '正常' },
        { value: data?.lowStock ?? 0, name: '库存不足' },
        { value: data?.expired ?? 0, name: '已过期' }
      ]
    }]
  })
}

function renderRadar(data: any) {
  if (!radarChart.value) return
  const chart = echarts.init(radarChart.value)
  // 安全评分（模拟）
  const inspScore = data.inspection?.completed ? Math.min(100, Math.round(data.inspection.completed / Math.max(1, data.inspection.total) * 100)) : 50
  const hazardScore = data.hazard?.closed ? Math.min(100, Math.round(data.hazard.closed / Math.max(1, data.hazard.total) * 100)) : 30
  const supplyScore = data.supply?.lowStock === 0 && data.supply?.expired === 0 ? 95 : 60
  const trainingScore = data.training?.totalCourses > 3 ? 85 : 50
  chart.setOption({
    tooltip: {},
    radar: {
      indicator: [
        { name: '巡检完成率', max: 100 },
        { name: '隐患处置率', max: 100 },
        { name: '物资保障率', max: 100 },
        { name: '培训覆盖率', max: 100 },
        { name: '应急响应', max: 100 }
      ],
      shape: 'polygon',
      axisName: { color: '#a0aec0' }
    },
    series: [{ type: 'radar', areaStyle: { opacity: 0.15 },
      data: [{ value: [inspScore, hazardScore, supplyScore, trainingScore, 75], name: '安全评分',
        lineStyle: { color: '#4299e1' }, itemStyle: { color: '#4299e1' }, areaStyle: { color: 'rgba(66,153,225,0.15)' }
      }]
    }]
  })
}

onMounted(() => loadData())
</script>

<style scoped>
.page-container { max-width: 1400px; }
.page-title { color: var(--text-primary); font-size: 20px; margin-bottom: 20px; }
.overview-cards { display: grid; grid-template-columns: repeat(6, 1fr); gap: 14px; }
.ov-card { padding: 18px; border-radius: var(--radius); display: flex; align-items: center; gap: 12px; box-shadow: var(--shadow); transition: transform 0.2s; }
.ov-card:hover { transform: translateY(-3px); }
.ov-icon { font-size: 28px; }
.ov-info { display: flex; flex-direction: column; }
.ov-val { font-size: 22px; font-weight: 700; color: #fff; }
.ov-label { font-size: 12px; color: rgba(255,255,255,0.8); }
@media (max-width: 1200px) { .overview-cards { grid-template-columns: repeat(3, 1fr); } }
</style>
