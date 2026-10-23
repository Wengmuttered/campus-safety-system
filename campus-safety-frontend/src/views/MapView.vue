<template>
  <div class="map-page fade-in-up">
    <div class="map-toolbar">
      <div class="toolbar-left">
        <el-select v-model="selectedType" placeholder="筛选点位类型" clearable size="default"
                   style="width: 180px" @change="filterPoints">
          <el-option v-for="t in pointTypes" :key="t.value" :label="t.label" :value="t.value" />
        </el-select>
        <el-button type="primary" @click="resetView">
          <el-icon><Aim /></el-icon> 重置视角
        </el-button>
        <el-switch v-model="showEvents" active-text="显示事件" inactive-text="隐藏事件"
                   style="margin-left:12px" @change="loadEvents" />
      </div>
      <div class="toolbar-right">
        <el-tag v-for="t in pointTypes" :key="t.value" :type="t.tagType" effect="dark" class="legend-tag">
          {{ t.icon }} {{ t.label }}
        </el-tag>
      </div>
    </div>

    <div class="map-container">
      <vc-viewer
        ref="viewerRef"
        :animation="false"
        :timeline="false"
        :info-box="true"
        :selection-indicator="true"
        :base-layer-picker="false"
        :geocoder="false"
        :home-button="false"
        :scene-mode-picker="false"
        :navigation-help-button="false"
        :full-screen-button="false"
        @ready="onViewerReady"
      >
        <!-- 解决没有底图的问题：在 onViewerReady 中使用原生 API 添加 -->

        <!-- 建筑物标注 -->
        <vc-entity
          v-for="b in buildings"
          :key="'b-' + b.id"
          :position="[b.lng, b.lat, 0]"
          :name="b.name"
          :description="'类型: ' + b.buildingType + ' | 楼层: ' + b.floorCount + ' | 容量: ' + b.capacity"
        >
          <vc-graphics-label
            :text="b.name"
            :font="'14px sans-serif'"
            :fill-color="'#63b3ed'"
            :outline-color="'#000'"
            :outline-width="2"
            :style="'FILL_AND_OUTLINE'"
            :pixel-offset="[0, -30]"
          />
          <vc-graphics-point :pixel-size="10" :color="'#4299e1'" />
        </vc-entity>

        <!-- 安全点位 -->
        <vc-entity
          v-for="p in filteredPoints"
          :key="'p-' + p.id"
          :position="[p.lng, p.lat, 0]"
          :name="p.name"
          :description="p.description || pointTypeLabel(p.type)"
        >
          <vc-graphics-point
            :pixel-size="12"
            :color="pointColor(p.type)"
            :outline-color="'#fff'"
            :outline-width="1"
          />
          <vc-graphics-label
            :text="pointEmoji(p.type)"
            :font="'18px sans-serif'"
            :pixel-offset="[0, -20]"
          />
        </vc-entity>

        <!-- 活跃事件标注 -->
        <vc-entity
          v-for="e in activeEvents"
          :key="'e-' + e.id"
          :position="[e.lng, e.lat, 0]"
          :name="e.title"
          :description="'类型: ' + eventTypeLabel(e.type) + ' | 严重程度: ' + e.severity + ' | 状态: ' + e.status"
        >
          <vc-graphics-point
            :pixel-size="16"
            :color="eventSeverityColor(e.severity)"
            :outline-color="'#fff'"
            :outline-width="2"
          />
          <vc-graphics-label
            :text="'⚠️ ' + e.title"
            :font="'13px sans-serif'"
            :fill-color="'#e53e3e'"
            :outline-color="'#000'"
            :outline-width="2"
            :style="'FILL_AND_OUTLINE'"
            :pixel-offset="[0, -28]"
          />
        </vc-entity>
      </vc-viewer>
    </div>

    <!-- 右侧面板 -->
    <div class="side-panel">
      <h3 class="panel-title">安全点位列表</h3>
      <div class="point-list">
        <div class="point-item" v-for="p in filteredPoints" :key="p.id" @click="flyToPoint(p)">
          <span class="point-emoji">{{ pointEmoji(p.type) }}</span>
          <div class="point-info">
            <span class="point-name">{{ p.name }}</span>
            <span class="point-type">{{ pointTypeLabel(p.type) }}</span>
          </div>
          <el-tag :type="p.status === 'NORMAL' ? 'success' : 'danger'" size="small">
            {{ p.status === 'NORMAL' ? '正常' : '异常' }}
          </el-tag>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, watch } from 'vue'
import { mapApi, mapLayerApi, safetyPointApi, eventApi } from '../api'
import { useCampusStore } from '../stores/campus'
import { getCampusViewport, TOP_DOWN_PITCH_DEG } from '../utils/campusMap'
import { configureViewerPerformance, applyViewerBasemap, applyMapLayerDefinitionsFromApi } from '../utils/basemap'

const campusStore = useCampusStore()
const viewerRef = ref<any>(null)
const buildings = ref<any[]>([])
const safetyPoints = ref<any[]>([])
const activeEvents = ref<any[]>([])
const selectedType = ref('')
const showEvents = ref(true)
let viewerInstance: any = null
let globalCesium: any = null

const pointTypes = [
  { value: 'FIRE_HYDRANT', label: '消防栓', icon: '🚒', tagType: 'danger' as const },
  { value: 'FIRE_EXTINGUISHER', label: '灭火器', icon: '🧯', tagType: 'danger' as const },
  { value: 'AED', label: 'AED除颤仪', icon: '💓', tagType: 'warning' as const },
  { value: 'SHELTER', label: '避难所', icon: '🏠', tagType: 'success' as const },
  { value: 'EXIT', label: '安全出口', icon: '🚪', tagType: 'success' as const },
  { value: 'CAMERA', label: '监控', icon: '📹', tagType: 'info' as const },
  { value: 'ALARM_BUTTON', label: '报警按钮', icon: '🔴', tagType: 'danger' as const },
  { value: 'FIRST_AID', label: '急救箱', icon: '🩹', tagType: 'warning' as const },
  { value: 'ASSEMBLY_POINT', label: '集合点', icon: '📍', tagType: 'info' as const }
]

const filteredPoints = computed(() => {
  if (!selectedType.value) return safetyPoints.value
  return safetyPoints.value.filter((p) => p.type === selectedType.value)
})

function pointEmoji(type: string) { return pointTypes.find((t) => t.value === type)?.icon || '📌' }
function pointTypeLabel(type: string) { return pointTypes.find((t) => t.value === type)?.label || type }
function pointColor(type: string) {
  const colors: Record<string, string> = {
    FIRE_HYDRANT: '#e53e3e', FIRE_EXTINGUISHER: '#e53e3e',
    AED: '#d69e2e', FIRST_AID: '#d69e2e',
    SHELTER: '#38a169', EXIT: '#38a169', ASSEMBLY_POINT: '#38a169',
    CAMERA: '#4299e1', ALARM_BUTTON: '#e53e3e'
  }
  return colors[type] || '#a0aec0'
}

function filterPoints() {
  // computed 自动处理
}

function flyToLocation(lng: number, lat: number, height: number, duration = 1.2) {
  if (!viewerInstance?.camera || !globalCesium) return
  viewerInstance.camera.flyTo({
    destination: globalCesium.Cartesian3.fromDegrees(lng, lat, height),
    orientation: {
      heading: 0,
      pitch: globalCesium.Math.toRadians(TOP_DOWN_PITCH_DEG),
      roll: 0
    },
    duration
  })
}

function flyToCampus(campusId: number, duration = 1.2) {
  const campus = getCampusViewport(campusId)
  flyToLocation(campus.lng, campus.lat, campus.defaultHeight, duration)
}

async function onViewerReady({ Cesium, viewer }: any) {
  viewerInstance = viewer
  globalCesium = Cesium
  configureViewerPerformance(viewer)

  try {
    const res: any = await mapLayerApi.list()
    const list = res?.data ?? []
    if (Array.isArray(list) && list.length > 0 && applyMapLayerDefinitionsFromApi(Cesium, viewer, list)) {
      /* 与控制台共用数据库图层配置 */
    } else {
      await applyViewerBasemap(Cesium, viewer)
    }
  } catch {
    await applyViewerBasemap(Cesium, viewer)
  }

  applyViewerPerf(viewer)
  flyToCampus(campusStore.currentCampusId, 1.8)
}

function applyViewerPerf(viewer: any) {
  try {
    if (viewer.scene?.globe) {
      viewer.scene.globe.enableLighting = false
      viewer.scene.globe.showGroundAtmosphere = false
      viewer.scene.globe.depthTestAgainstTerrain = false
      viewer.scene.globe.tileCacheSize = 1000
    }
    if (viewer.scene?.skyBox) viewer.scene.skyBox.show = false
    viewer.resolutionScale = 1
  } catch (e) {
    console.warn('[地图] 渲染参数调优失败（非关键）', e)
  }
}

function resetView() {
  flyToCampus(campusStore.currentCampusId, 1.1)
}

function flyToPoint(point: any) {
  flyToLocation(point.lng, point.lat, 350, 1)
}

const eventTypeMap: Record<string, string> = {
  FIRE: '火灾', EARTHQUAKE: '地震', FLOOD: '洪水', TYPHOON: '台风',
  CHEMICAL_LEAK: '化学品泄漏', POWER_OUTAGE: '停电', VIOLENCE: '暴力事件',
  MEDICAL: '医疗急救', TRAFFIC: '交通事故', OTHER: '其他'
}

function eventTypeLabel(type: string) { return eventTypeMap[type] || type }
function eventSeverityColor(severity: string) {
  const m: Record<string, string> = { CRITICAL: '#e53e3e', HIGH: '#ed8936', MEDIUM: '#d69e2e', LOW: '#38a169' }
  return m[severity] || '#a0aec0'
}

function getFallbackBuildings(campusId: number) {
  if (campusId === 2) {
    return [
      { id: 21, name: '云龙校区机电工程学院教学楼', lng: 110.4578, lat: 19.8603, buildingType: '教学楼', floorCount: 5, capacity: 1800 },
      { id: 22, name: '云龙校区图书信息中心', lng: 110.4563, lat: 19.8596, buildingType: '图书馆', floorCount: 4, capacity: 2000 },
      { id: 23, name: '云龙校区食堂', lng: 110.4583, lat: 19.8593, buildingType: '食堂', floorCount: 2, capacity: 1200 },
      { id: 24, name: '云龙校区学生公寓A栋', lng: 110.4587, lat: 19.859, buildingType: '宿舍', floorCount: 6, capacity: 600 },
      { id: 25, name: '云龙校区汽车与轨道交通学院实训楼', lng: 110.4571, lat: 19.8608, buildingType: '实训楼', floorCount: 3, capacity: 800 }
    ]
  }
  return [
    { id: 1, name: '美兰校区信息工程学院教学楼', lng: 110.4034, lat: 20.0451, buildingType: '教学楼', floorCount: 6, capacity: 2000 },
    { id: 2, name: '美兰校区图书馆', lng: 110.402, lat: 20.0447, buildingType: '图书馆', floorCount: 5, capacity: 3000 },
    { id: 3, name: '美兰校区第一学生食堂', lng: 110.4044, lat: 20.0437, buildingType: '食堂', floorCount: 3, capacity: 1500 },
    { id: 4, name: '美兰校区综合体育馆', lng: 110.4004, lat: 20.0461, buildingType: '体育场馆', floorCount: 2, capacity: 5000 },
    { id: 5, name: '美兰校区学生公寓1号楼', lng: 110.4058, lat: 20.0431, buildingType: '宿舍', floorCount: 7, capacity: 500 },
    { id: 6, name: '美兰校区行政办公楼', lng: 110.4026, lat: 20.0457, buildingType: '办公楼', floorCount: 4, capacity: 300 },
    { id: 7, name: '美兰校区化学与环境工程学院实验楼', lng: 110.404, lat: 20.0453, buildingType: '实验楼', floorCount: 4, capacity: 600 }
  ]
}

function getFallbackPoints(campusId: number) {
  if (campusId === 2) {
    return [
      { id: 31, name: '云龙校区机电学院教学楼消防栓', type: 'FIRE_HYDRANT', lng: 110.4579, lat: 19.8604, status: 'NORMAL' },
      { id: 32, name: '云龙校区图信中心AED', type: 'AED', lng: 110.4564, lat: 19.8597, status: 'NORMAL' },
      { id: 33, name: '云龙校区田径场集合点', type: 'ASSEMBLY_POINT', lng: 110.4573, lat: 19.8606, status: 'NORMAL' },
      { id: 34, name: '云龙校区东门安全出口', type: 'EXIT', lng: 110.4593, lat: 19.8588, status: 'NORMAL' }
    ]
  }
  return [
    { id: 1, name: '信息工程学院教学楼1楼消防栓', type: 'FIRE_HYDRANT', lng: 110.4035, lat: 20.0452, status: 'NORMAL' },
    { id: 2, name: '图书馆AED', type: 'AED', lng: 110.4021, lat: 20.0448, status: 'NORMAL' },
    { id: 3, name: '田径场集合点', type: 'ASSEMBLY_POINT', lng: 110.4007, lat: 20.0463, status: 'NORMAL' },
    { id: 4, name: '东门安全出口', type: 'EXIT', lng: 110.4064, lat: 20.0449, status: 'NORMAL' },
    { id: 5, name: '第一食堂灭火器', type: 'FIRE_EXTINGUISHER', lng: 110.4045, lat: 20.0438, status: 'NORMAL' },
    { id: 6, name: '学生公寓1号楼急救箱', type: 'FIRST_AID', lng: 110.4059, lat: 20.0432, status: 'NORMAL' },
    { id: 7, name: '行政办公楼监控', type: 'CAMERA', lng: 110.4027, lat: 20.0458, status: 'NORMAL' },
    { id: 8, name: '图书馆报警按钮', type: 'ALARM_BUTTON', lng: 110.4019, lat: 20.0446, status: 'NORMAL' }
  ]
}

async function loadEvents() {
  if (!showEvents.value) {
    activeEvents.value = []
    return
  }
  try {
    const res: any = await eventApi.getEvents(campusStore.currentCampusId, 0, 50)
    if (res.code === 200) {
      activeEvents.value = (res.data?.content || []).filter(
        (e: any) => e.status !== 'CLOSED' && e.status !== 'RESOLVED' && e.lng && e.lat
      )
    }
  } catch {
    activeEvents.value = []
  }
}

async function loadCampusData(campusId: number) {
  try {
    const [bRes, pRes]: any[] = await Promise.all([
      mapApi.getBuildings(campusId),
      safetyPointApi.getPoints(campusId)
    ])
    buildings.value = (bRes.code === 200 && Array.isArray(bRes.data) && bRes.data.length > 0) ? bRes.data : getFallbackBuildings(campusId)
    safetyPoints.value = (pRes.code === 200 && Array.isArray(pRes.data) && pRes.data.length > 0) ? pRes.data : getFallbackPoints(campusId)
  } catch {
    buildings.value = getFallbackBuildings(campusId)
    safetyPoints.value = getFallbackPoints(campusId)
  }
}

watch(() => campusStore.currentCampusId, (campusId) => {
  loadCampusData(campusId)
  loadEvents()
  flyToCampus(campusId, 1.2)
}, { immediate: true })
</script>

<style scoped>
.map-page {
  display: flex;
  flex-direction: column;
  height: calc(100vh - 108px);
  gap: 0;
  position: relative;
}

.map-toolbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px 16px;
  background: var(--bg-card);
  border-radius: var(--radius) var(--radius) 0 0;
  border: 1px solid var(--border-color);
  border-bottom: none;
}

.toolbar-left {
  display: flex;
  gap: 12px;
}

.toolbar-right {
  display: flex;
  gap: 6px;
  flex-wrap: wrap;
}

.legend-tag {
  font-size: 11px;
}

.map-container {
  flex: 1;
  border: 1px solid var(--border-color);
  border-radius: 0 0 0 var(--radius);
  overflow: hidden;
}

.map-container :deep(.cesium-viewer) {
  width: 100%;
  height: 100%;
}

.side-panel {
  position: absolute;
  right: 0;
  top: 52px;
  bottom: 0;
  width: 280px;
  background: rgba(26, 35, 50, 0.95);
  border-left: 1px solid var(--border-color);
  border-radius: 0 0 var(--radius) 0;
  overflow-y: auto;
  padding: 16px;
  backdrop-filter: blur(10px);
}

.panel-title {
  font-size: 15px;
  font-weight: 600;
  margin-bottom: 16px;
  color: var(--text-primary);
}

.point-list {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.point-item {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 10px;
  border-radius: 8px;
  cursor: pointer;
  transition: background 0.2s;
}

.point-item:hover {
  background: rgba(255, 255, 255, 0.06);
}

.point-emoji {
  font-size: 20px;
}

.point-info {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.point-name {
  font-size: 13px;
  color: var(--text-primary);
}

.point-type {
  font-size: 11px;
  color: var(--text-secondary);
}
</style>
