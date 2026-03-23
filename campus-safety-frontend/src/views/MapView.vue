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
import { ref, computed, onMounted } from 'vue'
import { mapApi, safetyPointApi } from '../api'

const viewerRef = ref<any>(null)
const buildings = ref<any[]>([])
const safetyPoints = ref<any[]>([])
const selectedType = ref('')
let viewerInstance: any = null

const pointTypes = [
  { value: 'FIRE_HYDRANT', label: '消防栓', icon: '🚒', tagType: 'danger' as const },
  { value: 'FIRE_EXTINGUISHER', label: '灭火器', icon: '🧯', tagType: 'danger' as const },
  { value: 'AED', label: 'AED除颤仪', icon: '💓', tagType: 'warning' as const },
  { value: 'SHELTER', label: '避难所', icon: '🏠', tagType: 'success' as const },
  { value: 'EXIT', label: '安全出口', icon: '🚪', tagType: 'success' as const },
  { value: 'CAMERA', label: '监控', icon: '📹', tagType: 'info' as const },
  { value: 'ALARM_BUTTON', label: '报警按钮', icon: '🔴', tagType: 'danger' as const },
  { value: 'FIRST_AID', label: '急救箱', icon: '🩹', tagType: 'warning' as const },
  { value: 'ASSEMBLY_POINT', label: '集合点', icon: '📍', tagType: '' as const }
]

const filteredPoints = computed(() => {
  if (!selectedType.value) return safetyPoints.value
  return safetyPoints.value.filter(p => p.type === selectedType.value)
})

function pointEmoji(type: string) {
  return pointTypes.find(t => t.value === type)?.icon || '📌'
}

function pointTypeLabel(type: string) {
  return pointTypes.find(t => t.value === type)?.label || type
}

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
  // computed自动处理
}

function onViewerReady({ Cesium, viewer }: any) {
  viewerInstance = viewer
  // 飞到校区中心
  viewer.camera.flyTo({
    destination: Cesium.Cartesian3.fromDegrees(110.3308, 20.0588, 1500),
    orientation: {
      heading: Cesium.Math.toRadians(0),
      pitch: Cesium.Math.toRadians(-45),
      roll: 0
    },
    duration: 2
  })
}

function resetView() {
  if (viewerInstance) {
    const Cesium = (window as any).Cesium
    viewerInstance.camera.flyTo({
      destination: Cesium.Cartesian3.fromDegrees(110.3308, 20.0588, 1500),
      duration: 1.5
    })
  }
}

function flyToPoint(point: any) {
  if (viewerInstance) {
    const Cesium = (window as any).Cesium
    viewerInstance.camera.flyTo({
      destination: Cesium.Cartesian3.fromDegrees(point.lng, point.lat, 300),
      duration: 1
    })
  }
}

onMounted(async () => {
  try {
    const [bRes, pRes]: any[] = await Promise.all([
      mapApi.getBuildings(1),
      safetyPointApi.getPoints(1)
    ])
    if (bRes.code === 200) buildings.value = bRes.data
    if (pRes.code === 200) safetyPoints.value = pRes.data
  } catch {
    // 使用初始化数据中的坐标模拟
    buildings.value = [
      { id: 1, name: '理工楼', lng: 110.3310, lat: 20.0590, buildingType: '教学楼', floorCount: 6, capacity: 2000 },
      { id: 2, name: '图书馆', lng: 110.3295, lat: 20.0585, buildingType: '图书馆', floorCount: 5, capacity: 3000 },
      { id: 3, name: '学生食堂', lng: 110.3320, lat: 20.0575, buildingType: '食堂', floorCount: 3, capacity: 1500 },
      { id: 4, name: '体育馆', lng: 110.3280, lat: 20.0600, buildingType: '体育场馆', floorCount: 2, capacity: 5000 },
      { id: 5, name: '学生宿舍1栋', lng: 110.3335, lat: 20.0570, buildingType: '宿舍', floorCount: 7, capacity: 500 },
      { id: 6, name: '行政楼', lng: 110.3300, lat: 20.0595, buildingType: '办公楼', floorCount: 4, capacity: 300 }
    ]
    safetyPoints.value = [
      { id: 1, name: '理工楼1楼消防栓', type: 'FIRE_HYDRANT', lng: 110.3311, lat: 20.0591, status: 'NORMAL' },
      { id: 2, name: '图书馆AED', type: 'AED', lng: 110.3296, lat: 20.0586, status: 'NORMAL' },
      { id: 3, name: '操场集合点', type: 'ASSEMBLY_POINT', lng: 110.3282, lat: 20.0602, status: 'NORMAL' },
      { id: 4, name: '东门安全出口', type: 'EXIT', lng: 110.3340, lat: 20.0588, status: 'NORMAL' },
      { id: 5, name: '食堂灭火器', type: 'FIRE_EXTINGUISHER', lng: 110.3321, lat: 20.0576, status: 'NORMAL' },
      { id: 6, name: '宿舍区急救箱', type: 'FIRST_AID', lng: 110.3336, lat: 20.0571, status: 'NORMAL' },
      { id: 7, name: '行政楼监控', type: 'CAMERA', lng: 110.3301, lat: 20.0596, status: 'NORMAL' },
      { id: 8, name: '图书馆报警按钮', type: 'ALARM_BUTTON', lng: 110.3294, lat: 20.0584, status: 'NORMAL' }
    ]
  }
})
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
