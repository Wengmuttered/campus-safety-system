<template>
  <div class="evacuation-page fade-in-up">
    <el-card>
      <template #header><span class="section-title">🏃 应急疏散路线导航 & AI 智能推荐</span></template>
      <div class="evacuation-layout">
        <!-- 左侧：建筑物选择 -->
        <div class="building-select">
          <h4>选择建筑物</h4>
          <div class="building-grid">
            <div
              v-for="b in buildings" :key="b.id"
              class="building-card"
              :class="{ active: selectedBuilding?.id === b.id }"
              @click="selectBuilding(b)"
            >
              <div class="building-icon">🏢</div>
              <div class="building-name">{{ b.name }}</div>
              <div class="building-meta">{{ b.floorCount }}层 | {{ b.capacity }}人</div>
            </div>
          </div>
        </div>

        <!-- 右侧：路线展示与智能推荐 -->
        <div class="route-info" v-if="selectedBuilding">
          <div class="route-header-bar">
            <h4>{{ selectedBuilding.name }} — 疏散路线</h4>
            <div class="route-controls">
              <el-switch v-model="showAccessibleOnly" active-text="仅无障碍" inactive-text="全部" size="small" style="margin-right: 12px;" />
              <el-button type="primary" size="small" @click="getRecommendation" :loading="recommending">
                🤖 AI 智能推荐
              </el-button>
            </div>
          </div>

          <!-- AI 推荐结果 -->
          <el-alert v-if="recommendation" :title="'🎯 AI 推荐：' + recommendation" type="success" show-icon :closable="false" style="margin-bottom: 16px;" />

          <!-- 路线对比图 -->
          <div v-if="scoredRoutes.length > 1" class="route-comparison">
            <div class="comparison-title">📊 路线综合对比</div>
            <div class="comparison-bars">
              <div v-for="sr in scoredRoutes" :key="sr.routeId" class="bar-group">
                <div class="bar-label">{{ sr.routeName.replace(/疏散路线|路线/g, '') }}</div>
                <div class="bar-row">
                  <span class="bar-tag">AI评分</span>
                  <div class="bar-track">
                    <div class="bar-fill score" :style="{ width: (sr.aiScore * 100) + '%' }">
                      {{ (sr.aiScore * 100).toFixed(0) }}
                    </div>
                  </div>
                </div>
                <div class="bar-row">
                  <span class="bar-tag">拥堵率</span>
                  <div class="bar-track">
                    <div class="bar-fill congestion" :style="{ width: (sr.congestionRate * 100) + '%' }">
                      {{ (sr.congestionRate * 100).toFixed(0) }}%
                    </div>
                  </div>
                </div>
                <el-tag v-if="sr.recommended" type="success" size="small" effect="dark" style="margin-top:4px;">✅ 推荐</el-tag>
              </div>
            </div>
          </div>

          <!-- 路线列表 -->
          <div v-if="filteredRoutes.length === 0" class="empty-routes">
            <p>暂无{{ showAccessibleOnly ? '无障碍' : '' }}疏散路线数据</p>
          </div>
          <div v-else class="route-list">
            <div v-for="r in filteredRoutes" :key="r.id" class="route-card"
                 :class="{ 'route-recommended': isRecommended(r.id) }">
              <div class="route-header">
                <span class="route-name">{{ r.name }}</span>
                <div class="route-tags">
                  <el-tag v-if="r.accessible" type="success" size="small">♿ 无障碍</el-tag>
                  <el-tag v-if="isRecommended(r.id)" type="warning" size="small" effect="dark">🤖 AI推荐</el-tag>
                </div>
              </div>
              <div class="route-stats">
                <span>📏 {{ r.distance }}m</span>
                <span>⏱ {{ getAdjustedTime(r.id) || r.estimatedTime }}秒</span>
                <span>👥 容量{{ r.capacity }}人</span>
                <span v-if="getCongestion(r.id)" :class="getCongestionClass(r.id)">
                  📶 拥堵 {{ (getCongestion(r.id) * 100).toFixed(0) }}%
                </span>
              </div>
              <p v-if="r.description" class="route-desc">{{ r.description }}</p>
            </div>
          </div>

          <!-- 疏散模拟 -->
          <div class="simulation-panel" v-if="filteredRoutes.length > 0">
            <div class="sim-header">
              <span class="sim-title">🚀 疏散模拟</span>
              <div class="sim-controls">
                <el-input-number v-model="simPersonCount" :min="50" :max="5000" :step="50" size="small" style="width: 130px;" />
                <span style="font-size:12px;color:var(--text-secondary);margin-left:4px;">人</span>
                <el-button v-if="!simRunning" type="danger" size="small" @click="startSimulation" style="margin-left: 12px;">
                  ▶ 启动模拟
                </el-button>
                <el-button v-else type="info" size="small" @click="stopSimulation">
                  ⏹ 停止
                </el-button>
              </div>
            </div>
            <div v-if="simRunning || simComplete" class="sim-body">
              <el-progress
                :percentage="simProgress"
                :status="simComplete ? 'success' : ''"
                :stroke-width="20"
                :text-inside="true"
                style="margin-bottom: 12px;"
              />
              <div class="sim-stats">
                <div class="sim-stat">
                  <span class="stat-num">{{ simEvacuated }}</span>
                  <span class="stat-label">已撤离</span>
                </div>
                <div class="sim-stat">
                  <span class="stat-num">{{ simPersonCount - simEvacuated }}</span>
                  <span class="stat-label">剩余</span>
                </div>
                <div class="sim-stat">
                  <span class="stat-num">{{ simElapsed }}s</span>
                  <span class="stat-label">用时</span>
                </div>
                <div class="sim-stat" v-if="simComplete">
                  <span class="stat-num success">✅</span>
                  <span class="stat-label">疏散完成</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="route-info" v-else>
          <div class="select-hint">
            <el-icon :size="64" color="#4a5568"><Guide /></el-icon>
            <p>请选择左侧的建筑物查看疏散路线</p>
          </div>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { mapApi, evacuationApi } from '../api'
import { useCampusStore } from '../stores/campus'

const campusStore = useCampusStore()
const buildings = ref<any[]>([])
const selectedBuilding = ref<any>(null)
const routes = ref<any[]>([])
const showAccessibleOnly = ref(false)
const recommending = ref(false)
const recommendation = ref('')
const scoredRoutes = ref<any[]>([])

// 疏散模拟
const simPersonCount = ref(500)
const simRunning = ref(false)
const simComplete = ref(false)
const simProgress = ref(0)
const simEvacuated = ref(0)
const simElapsed = ref(0)
let simTimer: number | null = null

const filteredRoutes = computed(() => {
  if (!showAccessibleOnly.value) return routes.value
  return routes.value.filter(r => r.accessible)
})

function isRecommended(routeId: number) {
  return scoredRoutes.value.find(sr => sr.routeId === routeId)?.recommended
}

function getAdjustedTime(routeId: number) {
  return scoredRoutes.value.find(sr => sr.routeId === routeId)?.adjustedTime
}

function getCongestion(routeId: number) {
  return scoredRoutes.value.find(sr => sr.routeId === routeId)?.congestionRate
}

function getCongestionClass(routeId: number) {
  const rate = getCongestion(routeId) || 0
  if (rate > 0.7) return 'congestion-high'
  if (rate > 0.4) return 'congestion-mid'
  return 'congestion-low'
}

async function selectBuilding(b: any) {
  selectedBuilding.value = b
  recommendation.value = ''
  scoredRoutes.value = []
  stopSimulation()
  try {
    const res: any = await evacuationApi.getRoutes(b.id)
    if (res.code === 200) routes.value = res.data || []
  } catch {
    routes.value = []
  }
}

async function getRecommendation() {
  if (!selectedBuilding.value) return
  recommending.value = true
  try {
    const res: any = await evacuationApi.recommend(
      selectedBuilding.value.id,
      selectedBuilding.value.floorCount || 1,
      simPersonCount.value
    )
    if (res.code === 200 && res.data) {
      recommendation.value = res.data.recommendation || ''
      scoredRoutes.value = res.data.routes || []
    }
  } catch {
    recommendation.value = '推荐服务暂不可用，请使用默认路线'
  } finally {
    recommending.value = false
  }
}

function startSimulation() {
  simRunning.value = true
  simComplete.value = false
  simProgress.value = 0
  simEvacuated.value = 0
  simElapsed.value = 0

  const totalTime = Math.max(...routes.value.map((r: any) => r.estimatedTime || 60), 60)
  const step = 500 // ms per tick

  simTimer = window.setInterval(() => {
    simElapsed.value += step / 1000

    // 非线性疏散曲线（前快后慢）
    const ratio = Math.min(1, simElapsed.value / (totalTime * 0.8))
    const curve = 1 - Math.pow(1 - ratio, 2.5)
    simEvacuated.value = Math.min(simPersonCount.value, Math.floor(curve * simPersonCount.value))
    simProgress.value = Math.floor((simEvacuated.value / simPersonCount.value) * 100)

    if (simEvacuated.value >= simPersonCount.value) {
      simComplete.value = true
      simRunning.value = false
      if (simTimer) clearInterval(simTimer)
    }
  }, step)
}

function stopSimulation() {
  simRunning.value = false
  if (simTimer) { clearInterval(simTimer); simTimer = null }
}

onMounted(async () => {
  try {
    const res: any = await mapApi.getBuildings(campusStore.currentCampusId)
    if (res.code === 200) buildings.value = res.data
  } catch {
    buildings.value = [
      { id: 1, name: '理工楼', floorCount: 6, capacity: 2000 },
      { id: 2, name: '图书馆', floorCount: 5, capacity: 3000 },
      { id: 3, name: '学生食堂', floorCount: 3, capacity: 1500 },
      { id: 4, name: '体育馆', floorCount: 2, capacity: 5000 },
      { id: 5, name: '学生宿舍1栋', floorCount: 7, capacity: 500 },
      { id: 6, name: '行政楼', floorCount: 4, capacity: 300 }
    ]
  }
})

onUnmounted(() => stopSimulation())
</script>

<style scoped>
.evacuation-layout { display: grid; grid-template-columns: 280px 1fr; gap: 24px; min-height: 500px; }
.building-select h4, .route-info h4 { margin-bottom: 0; color: var(--text-primary); }
.building-grid { display: flex; flex-direction: column; gap: 10px; }
.building-card { padding: 14px; border-radius: 10px; background: rgba(255,255,255,0.04); cursor: pointer; transition: all 0.2s; border: 1px solid transparent; }
.building-card:hover { background: rgba(255,255,255,0.08); }
.building-card.active { border-color: #4299e1; background: rgba(66,153,225,0.1); }
.building-icon { font-size: 24px; margin-bottom: 4px; }
.building-name { font-weight: 600; color: var(--text-primary); }
.building-meta { font-size: 12px; color: var(--text-secondary); margin-top: 4px; }

.route-header-bar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px; flex-wrap: wrap; gap: 10px; }
.route-controls { display: flex; align-items: center; }

.route-list { display: flex; flex-direction: column; gap: 12px; }
.route-card { padding: 16px; border-radius: 10px; background: rgba(255,255,255,0.04); border: 1px solid var(--border-color); transition: all 0.3s; }
.route-card.route-recommended { border-color: #48bb78; background: rgba(72,187,120,0.08); box-shadow: 0 0 12px rgba(72,187,120,0.15); }
.route-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px; }
.route-tags { display: flex; gap: 6px; }
.route-name { font-weight: 600; color: var(--text-primary); }
.route-stats { display: flex; gap: 16px; font-size: 13px; color: var(--text-secondary); flex-wrap: wrap; }
.route-desc { font-size: 13px; color: var(--text-secondary); margin-top: 8px; }

.congestion-high { color: #fc8181 !important; font-weight: bold; }
.congestion-mid { color: #fbd38d !important; }
.congestion-low { color: #68d391 !important; }

/* 路线对比 */
.route-comparison { background: rgba(255,255,255,0.03); border: 1px solid var(--border-color); border-radius: 10px; padding: 16px; margin-bottom: 16px; }
.comparison-title { font-weight: 600; margin-bottom: 12px; color: var(--text-primary); }
.comparison-bars { display: flex; gap: 20px; flex-wrap: wrap; }
.bar-group { flex: 1; min-width: 160px; }
.bar-label { font-size: 13px; font-weight: 600; color: var(--text-primary); margin-bottom: 6px; }
.bar-row { display: flex; align-items: center; gap: 6px; margin-bottom: 4px; }
.bar-tag { font-size: 11px; color: var(--text-secondary); width: 44px; flex-shrink: 0; }
.bar-track { flex: 1; height: 16px; background: rgba(255,255,255,0.06); border-radius: 8px; overflow: hidden; }
.bar-fill { height: 100%; border-radius: 8px; font-size: 10px; color: #fff; display: flex; align-items: center; justify-content: center; min-width: 20px; transition: width 0.6s ease; }
.bar-fill.score { background: linear-gradient(90deg, #48bb78, #38a169); }
.bar-fill.congestion { background: linear-gradient(90deg, #ed8936, #e53e3e); }

/* 疏散模拟 */
.simulation-panel { margin-top: 24px; background: rgba(255,255,255,0.03); border: 1px solid var(--border-color); border-radius: 10px; padding: 16px; }
.sim-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px; flex-wrap: wrap; gap: 10px; }
.sim-title { font-size: 15px; font-weight: 600; color: var(--text-primary); }
.sim-controls { display: flex; align-items: center; }
.sim-stats { display: flex; gap: 24px; justify-content: center; flex-wrap: wrap; }
.sim-stat { display: flex; flex-direction: column; align-items: center; }
.stat-num { font-size: 28px; font-weight: 700; color: var(--text-primary); }
.stat-num.success { color: #48bb78; }
.stat-label { font-size: 12px; color: var(--text-secondary); }

.empty-routes, .select-hint { text-align: center; padding: 60px 0; color: var(--text-secondary); }
.section-title { font-weight: 600; color: var(--text-primary); }
</style>
