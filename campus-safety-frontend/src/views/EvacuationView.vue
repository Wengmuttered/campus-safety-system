<template>
  <div class="evacuation-page fade-in-up">
    <el-card>
      <template #header><span class="section-title">🏃 应急疏散路线导航</span></template>
      <div class="evacuation-layout">
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

        <div class="route-info" v-if="selectedBuilding">
          <h4>{{ selectedBuilding.name }} — 疏散路线</h4>
          <div v-if="routes.length === 0" class="empty-routes">
            <p>暂无该建筑的疏散路线数据</p>
            <p class="hint">管理员可在后台添加疏散路线</p>
          </div>
          <div v-else class="route-list">
            <div v-for="r in routes" :key="r.id" class="route-card">
              <div class="route-header">
                <span class="route-name">{{ r.name }}</span>
                <el-tag v-if="r.accessible" type="success" size="small">♿ 无障碍</el-tag>
              </div>
              <div class="route-stats">
                <span>📏 {{ r.distance }}m</span>
                <span>⏱ {{ r.estimatedTime }}秒</span>
                <span>👥 容量{{ r.capacity }}人</span>
              </div>
              <p v-if="r.description" class="route-desc">{{ r.description }}</p>
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
import { ref, onMounted } from 'vue'
import { mapApi, evacuationApi } from '../api'

const buildings = ref<any[]>([])
const selectedBuilding = ref<any>(null)
const routes = ref<any[]>([])

async function selectBuilding(b: any) {
  selectedBuilding.value = b
  try {
    const res: any = await evacuationApi.getRoutes(b.id)
    if (res.code === 200) routes.value = res.data || []
  } catch {
    routes.value = []
  }
}

onMounted(async () => {
  try {
    const res: any = await mapApi.getBuildings(1)
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
</script>

<style scoped>
.evacuation-layout { display: grid; grid-template-columns: 300px 1fr; gap: 24px; min-height: 500px; }
.building-select h4, .route-info h4 { margin-bottom: 16px; color: var(--text-primary); }
.building-grid { display: flex; flex-direction: column; gap: 10px; }
.building-card { padding: 14px; border-radius: 10px; background: rgba(255,255,255,0.04); cursor: pointer; transition: all 0.2s; border: 1px solid transparent; }
.building-card:hover { background: rgba(255,255,255,0.08); }
.building-card.active { border-color: #4299e1; background: rgba(66,153,225,0.1); }
.building-icon { font-size: 24px; margin-bottom: 4px; }
.building-name { font-weight: 600; color: var(--text-primary); }
.building-meta { font-size: 12px; color: var(--text-secondary); margin-top: 4px; }
.route-list { display: flex; flex-direction: column; gap: 12px; }
.route-card { padding: 16px; border-radius: 10px; background: rgba(255,255,255,0.04); border: 1px solid var(--border-color); }
.route-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px; }
.route-name { font-weight: 600; color: var(--text-primary); }
.route-stats { display: flex; gap: 16px; font-size: 13px; color: var(--text-secondary); }
.route-desc { font-size: 13px; color: var(--text-secondary); margin-top: 8px; }
.empty-routes, .select-hint { text-align: center; padding: 60px 0; color: var(--text-secondary); }
.hint { font-size: 12px; margin-top: 8px; }
.section-title { font-weight: 600; color: var(--text-primary); }
</style>
