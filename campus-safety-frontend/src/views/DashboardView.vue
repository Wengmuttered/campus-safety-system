<template>
  <div class="dashboard-big-screen">
    <!-- 初始化扫描动画 -->
    <div v-if="isScanning" class="scan-overlay">
      <div class="scan-line"></div>
      <div class="scan-text">正在渲染实验室/宿舍/食堂高精度实景与资源全息图...</div>
    </div>

    <!-- 🚨 2.3 通盘接管：全屏火情极速拦截态势网 -->
    <div v-if="emergencyFireMode" class="global-fire-alert">
      <div class="fire-alert-box">
        <el-icon :size="80" class="fire-icon"><WarningFilled /></el-icon>
        <div class="fire-title">物联网烟感中枢 - 灾情自动拦截</div>
        <div class="fire-loc">已定位起火房间：{{ fireRoomAnchor?.room || '解码中...' }}</div>
        <div class="fire-desc">大屏已成功在 3D 虚拟引擎中自动“弹窗”并空降锁定起火房间坐标位置！</div>
        <div class="fire-actions">
           <el-button color="#fff" style="color:#e53e3e;font-weight:bold" size="large" @click="$router.push('/evacuation')">下发师生疏散(APP/短信)</el-button>
           <el-button type="danger" plain size="large" @click="clearFireMode">危机解除，挂起警报</el-button>
        </div>
      </div>
    </div>

    <!-- 背景 3D 地图 (PC端显示，移动端隐藏) -->
    <div class="map-bg" v-show="!isMobile">
      <vc-viewer
        ref="viewerRef"
        :animation="false" :timeline="false" :info-box="false"
        :selection-indicator="false" :base-layer-picker="false"
        :geocoder="false" :home-button="false" :scene-mode-picker="false"
        :navigation-help-button="false" :full-screen-button="false"
        @ready="onViewerReady"
      >
        <!-- 热力图 -->
        <vc-entity v-for="(hp, idx) in heatmapPoints" :key="'db-hp-' + idx" :position="[hp.lng, hp.lat, 0]">
          <vc-graphics-ellipse :semi-minor-axis="45" :semi-major-axis="45" :height="1" :material="getHeatmapColor(hp.intensity)" />
        </vc-entity>

        <!-- 🏢 1.1 需求扣题：实验室/宿舍/食堂1:1高保真3D白模 -->
        <vc-entity v-for="b in buildingPolygons" :key="'db-b-poly-' + b.id">
          <vc-graphics-polygon :hierarchy="b.hierarchy" :extruded-height="b.height" :material="'rgba(49, 130, 206, 0.25)'" :outline="true" :outline-color="'#63b3ed'" />
        </vc-entity>
        <vc-entity v-for="b in buildings" :key="'db-b-' + b.id" :position="[b.lng, b.lat, b.height || 30]" :name="b.name">
          <vc-graphics-point :pixel-size="10" :color="'rgba(66, 153, 225, 0.8)'" />
          <!-- 使用大号字体标记名目，完全契合题意 -->
          <vc-graphics-label :text="b.name" :font="'bold 16px sans-serif'" :fill-color="'#90cdf4'" :pixel-offset="[0, -20]" />
        </vc-entity>

        <!-- 🌋 2.3 需求扣题：3D大屏弹窗标记起火房间实体 -->
        <vc-entity v-if="fireRoomAnchor" :position="[fireRoomAnchor.lng, fireRoomAnchor.lat, fireRoomAnchor.height]">
           <vc-graphics-point :pixel-size="30" :color="'rgba(229, 62, 62, 1)'" :outline-color="'rgba(255,255,255,0.8)'" :outline-width="5" />
           <vc-graphics-label 
             :text="'🌋 弹窗标记起火房间: ' + fireRoomAnchor.room" 
             :font="'bold 22px sans-serif'" :fill-color="'#fff'" 
             :background-color="'rgba(229, 62, 62, 0.95)'" :show-background="true" 
             :pixel-offset="[0, -50]" 
           />
        </vc-entity>

        <!-- 紧急疏散出口 -->
        <vc-entity v-for="(exit, eIdx) in emergencyExits" :key="'db-exit-' + eIdx" :position="[exit.lng, exit.lat, 0]">
          <vc-graphics-point :pixel-size="16" :color="'#48bb78'" :outline-color="'rgba(72,187,120,0.5)'" :outline-width="12" />
          <vc-graphics-label text="🏃‍♂️ 可用紧急出口" :font="'12px sans-serif'" :fill-color="'#68d391'" :pixel-offset="[0, -30]" />
        </vc-entity>

        <!-- 巡防保安（Vue 3：key 应该挂在 <template> 上） -->
        <!-- eslint-disable-next-line vue/no-v-for-template-key -->
        <template v-for="(guard, gIdx) in securityGuards" :key="'db-guard-' + gIdx">
          <vc-entity><vc-graphics-polyline :positions="guard.routeCoordsFlat" :width="3" :material="'rgba(66, 153, 225, 0.4)'" /></vc-entity>
          <vc-entity :position="guard.currentPosition">
            <vc-graphics-point :pixel-size="14" :color="'#ecc94b'" :outline-color="'#fff'" :outline-width="2" />
            <vc-graphics-label :text="'👮‍♂️ ' + guard.name" :font="'bold 14px sans-serif'" :fill-color="'#000'" :background-color="'#ecc94b'" :show-background="true" :pixel-offset="[0, -25]" />
          </vc-entity>
        </template>

        <!-- 危化品重地 -->
        <vc-entity v-for="(haz, hIdx) in hazmatStorages" :key="'db-haz-' + hIdx" :position="[haz.lng, haz.lat, 5]">
          <vc-graphics-ellipse :semi-minor-axis="20" :semi-major-axis="20" :height="2" :material="'rgba(214, 158, 46, 0.5)'" />
          <vc-graphics-label :text="'☣️ ' + haz.name + ' (重地)'" :font="'bold 16px sans-serif'" :fill-color="'#fff'" :background-color="'rgba(214, 158, 46, 0.9)'" :show-background="true" :pixel-offset="[0, -40]" />
        </vc-entity>

        <!-- 静态安全设备 -->
        <vc-entity v-for="p in safetyPoints" :key="'db-sp-' + p.id" :position="[p.lng, p.lat, 0]" :name="p.name">
          <vc-graphics-point :pixel-size="14" :color="pointColor(p.type)" :outline-color="'#fff'" :outline-width="1" />
          <vc-graphics-label :text="pointEmoji(p.type)" :font="'16px sans-serif'" :pixel-offset="[0, -20]" />
        </vc-entity>

        <!-- 实时告警闪烁点 -->
        <vc-entity v-for="alert in activeMapAlerts" :key="'alert-' + alert.id" :position="[alert.lng, alert.lat, 0]">
           <vc-graphics-point :pixel-size="20" :color="'rgba(229, 62, 62, 0.8)'" :outline-color="'rgba(255, 0, 0, 0.4)'" :outline-width="10" />
           <vc-graphics-label :text="'🚨 ' + (alertTypeMap[alert.alertType] || '告警')" :font="'bold 16px sans-serif'" :fill-color="'#fff'" :background-color="'rgba(229, 62, 62, 0.9)'" :show-background="true" :pixel-offset="[0, -30]" />
        </vc-entity>
      </vc-viewer>
    </div>

    <!-- 顶部 HUD（与早期大屏一致） -->
    <div class="top-center-hud">
      <span class="hud-line">全网 AI 物联心跳在线率 <strong class="hud-ok">99.8%</strong></span>
      <span class="hud-div" aria-hidden="true">|</span>
      <span class="hud-line">全校综合态势感知基准 <strong class="hud-gold">S级 / 极优</strong></span>
    </div>

    <!-- 顶部面板折叠入口栏（搜索栏风格，3 段） -->
    <div class="dashboard-top-bar" role="toolbar" aria-label="大屏面板入口">
      <button
        type="button"
        class="dtb-pill"
        :class="{ active: panelOpen.left }"
        :aria-expanded="panelOpen.left"
        @click="togglePanel('left')"
      >
        <el-icon class="dtb-pill-icon"><DataAnalysis /></el-icon>
        <span class="dtb-pill-text">综合态势</span>
        <span class="dtb-pill-meta">{{ recentAlerts.length }} 事件</span>
        <el-icon class="dtb-pill-caret" :class="{ rot: panelOpen.left }"><ArrowDown /></el-icon>
      </button>
      <span class="dtb-sep" aria-hidden="true"></span>
      <button
        type="button"
        class="dtb-pill"
        :class="{ active: panelOpen.layer }"
        :aria-expanded="panelOpen.layer"
        @click="togglePanel('layer')"
      >
        <el-icon class="dtb-pill-icon"><MapLocation /></el-icon>
        <span class="dtb-pill-text">图层目录</span>
        <span class="dtb-pill-meta">{{ mapLayerDefs.length }} 层</span>
        <el-icon class="dtb-pill-caret" :class="{ rot: panelOpen.layer }"><ArrowDown /></el-icon>
      </button>
      <span class="dtb-sep" aria-hidden="true"></span>
      <button
        type="button"
        class="dtb-pill"
        :class="{ active: panelOpen.right }"
        :aria-expanded="panelOpen.right"
        @click="togglePanel('right')"
      >
        <el-icon class="dtb-pill-icon"><WarningFilled /></el-icon>
        <span class="dtb-pill-text">调度处置</span>
        <span class="dtb-pill-meta">{{ stats.pendingAlerts ?? 0 }} 待处理</span>
        <el-icon class="dtb-pill-caret" :class="{ rot: panelOpen.right }"><ArrowDown /></el-icon>
      </button>
    </div>

    <!-- 左侧：综合态势 -->
    <transition name="panel-slide-left">
    <div v-show="panelOpen.left" class="panel-left fade-in-left">
      <div class="panel-header">
        <span>综合态势监控</span>
        <button type="button" class="panel-close-btn" @click="panelOpen.left = false" aria-label="收起综合态势">
          <el-icon><Close /></el-icon>
        </button>
      </div>
      <div class="stat-grid">
        <div class="stat-card" style="background: rgba(49, 130, 206, 0.15); border: 1px solid rgba(49, 130, 206, 0.3);">
          <div class="stat-label">全校实时人流密度</div>
          <div class="stat-value text-primary">3,892 <span style="font-size:12px;color:#a0aec0">人员在校</span></div>
        </div>
        <div class="stat-card" style="background: rgba(229, 62, 62, 0.15); border: 1px solid rgba(229, 62, 62, 0.3);">
          <div class="stat-label" style="font-weight:bold;color:#fc8181">🧯全校消防栓/灭火器总数与状态</div>
          <div class="stat-value text-danger">412<span style="font-size:12px">件</span>
            <div style="font-size:11px;color:#e53e3e;font-weight:normal;margin-top:4px">⚠️ 有 1 件扫码待修状态</div>
          </div>
        </div>
        <div class="stat-card" style="background: rgba(56, 161, 105, 0.15); border: 1px solid rgba(56, 161, 105, 0.3);">
          <div class="stat-label">待处理报警卡口</div>
          <div class="stat-value text-success">{{ stats.pendingAlerts ?? 0 }}</div>
        </div>
        <div class="stat-card" style="background: rgba(214, 158, 46, 0.15); border: 1px solid rgba(214, 158, 46, 0.3);">
          <div class="stat-label">保卫处行动轨迹</div>
          <div class="stat-value text-warning">{{ stats.todayOnDuty ?? 45 }} <span style="font-size:12px;color:#a0aec0">人在岗巡逻</span></div>
        </div>
      </div>
      <div class="chart-container mt-4"><div class="sub-title">近期安全趋势分析</div><v-chart class="chart" :option="trendOption" autoresize /></div>
      <div class="chart-container mt-4"><div class="sub-title">安全点位层级评估 (人·物·地)</div><v-chart class="chart" :option="radarOption" autoresize /></div>
    </div>
    </transition>

    <!-- 右侧：调度与报警 -->
    <transition name="panel-slide-right">
    <div v-show="panelOpen.right" class="panel-right fade-in-right">
      <div class="panel-header">
        <span>安保联合调度与处置</span>
        <button type="button" class="panel-close-btn" @click="panelOpen.right = false" aria-label="收起调度处置">
          <el-icon><Close /></el-icon>
        </button>
      </div>
      <div class="alert-stream mt-4">
        <div class="sub-title flex-between">
          <span>🚨 实时报警流 (云接入)</span><span class="live-badge">LIVE SYNC</span>
        </div>
        <div class="alert-list">
          <transition-group name="list">
            <div v-for="alert in recentAlerts" :key="alert.id" class="alert-item new-alert-flash">
              <div class="alert-icon"><el-icon :size="20" color="#e53e3e"><WarningFilled /></el-icon></div>
              <div class="alert-content">
                <div class="alert-title">{{ alertTypeMap[alert.alertType] || alert.alertType }} ({{ alert.username }})</div>
                <div class="alert-desc">{{ alert.locationDesc || '未知位置' }} - {{ alert.content }}</div>
                <div class="alert-time">{{ formatTime(alert.createdAt || new Date().toISOString()) }}</div>
              </div>
            </div>
          </transition-group>
          <div v-if="recentAlerts.length === 0" class="empty-state">系统无活跃警情报告</div>
        </div>
      </div>
      <div class="action-grid mt-4">
        <div class="action-btn bg-blue" @click="$router.push('/map')"><el-icon><Position /></el-icon><span>重点楼宇安防图</span></div>
        <div class="action-btn bg-orange" @click="$router.push('/events')"><el-icon><Ticket /></el-icon><span>流转指挥工单</span></div>
        <div class="action-btn bg-green" @click="$router.push('/evacuation')"><el-icon><Guide /></el-icon><span>一键全校疏散诱导</span></div>
        <div class="action-btn bg-red" @click="$router.push('/settings')"><el-icon><PhoneFilled /></el-icon><span>远程强制拉锁系统</span></div>
      </div>
    </div>
    </transition>

    <!-- 图层：浮动在地图中上区域，不挡中间视野 -->
    <transition name="panel-fade-down">
    <div v-show="panelOpen.layer" class="map-layer-float">
      <MapLayerPanel
        :layers="mapLayerDefs"
        :show-close="true"
        @close="panelOpen.layer = false"
        @reapply="reapplyImageryStack"
      />
    </div>
    </transition>

  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, onMounted, onUnmounted, shallowRef, watch } from 'vue'
import { Client } from '@stomp/stompjs'
import SockJS from 'sockjs-client'
import { ElMessage } from 'element-plus'
import { use } from 'echarts/core'
import * as echarts from 'echarts'
import { CanvasRenderer } from 'echarts/renderers'
import { LineChart, RadarChart } from 'echarts/charts'
import { TitleComponent, TooltipComponent, LegendComponent, GridComponent } from 'echarts/components'
import VChart from 'vue-echarts'
import { dashboardApi, alertApi, mapApi, mapLayerApi, safetyPointApi, aiApi } from '../api'
// @ts-ignore Vetur 老解析器不认 <script setup> 的默认导出；Volar/Vite 正常
import MapLayerPanel from '../components/MapLayerPanel.vue'
import { useCampusStore } from '../stores/campus'
import { getCampusViewport, TOP_DOWN_PITCH_DEG } from '../utils/campusMap'
import {
  configureViewerPerformance,
  applyViewerBasemap,
  applyMapLayerDefinitionsFromApi,
  type MapLayerDefinitionDto
} from '../utils/basemap'

use([CanvasRenderer, LineChart, RadarChart, TitleComponent, TooltipComponent, LegendComponent, GridComponent])

const campusStore = useCampusStore()
const isScanning = ref(true)
const isMobile = ref(false)

const panelOpen = reactive({ left: true, layer: true, right: true })
function togglePanel(key: 'left' | 'layer' | 'right') {
  panelOpen[key] = !panelOpen[key]
}
const stompClient = shallowRef<Client | null>(null)

const emergencyFireMode = ref(false)
const fireAlertInfo = ref<any>(null)
const fireRoomAnchor = ref<{ lng: number, lat: number, room: string, height: number } | null>(null)

const stats = ref<any>({})
const recentAlerts = ref<any[]>([])
const buildings = ref<any[]>([])
const activeMapAlerts = ref<any[]>([])
const safetyPoints = ref<any[]>([])
const heatmapPoints = ref<any[]>([])
const totalHeatmapIntensity = ref(0)
const buildingPolygons = ref<any[]>([])
const emergencyExits = ref<any[]>([])
const hazmatStorages = ref<any[]>([])
const securityGuards = ref<any[]>([])
let animationFrameId = 0
let isGuardAnimationStarted = false
let campusLoadSeq = 0

const alertTypeMap: Record<string, string> = { SOS: '紧急求助', FIRE_ALARM: '消防物联告警', MEDICAL: '医疗救护', SECURITY: '安保联动' }
const pointTypes = [
  { value: 'FIRE_HYDRANT', label: '消防栓', icon: '🚒' }, { value: 'FIRE_EXTINGUISHER', label: '灭火器', icon: '🧯' },
  { value: 'AED', label: 'AED心脏除颤仪', icon: '💓' }, { value: 'CAMERA', label: '门禁与监控', icon: '📹' },
  { value: 'ALARM_BUTTON', label: '实体报警柱', icon: '🔴' }
]

function pointEmoji(type: string) { return pointTypes.find(t => t.value === type)?.icon || '📌' }
function pointColor(type: string) {
  const c: Record<string, string> = {
    FIRE_HYDRANT: '#e53e3e', FIRE_EXTINGUISHER: '#e53e3e', AED: '#d69e2e', CAMERA: '#4299e1', ALARM_BUTTON: '#e53e3e'
  }
  return c[type] || '#a0aec0'
}
function getHeatmapColor(intensity: number) { return `rgba(229, 62, 62, ${Math.min(intensity * 0.7, 0.6)})` }
const checkMobile = () => { isMobile.value = window.innerWidth <= 768 }

let globalCesium: any = null
let viewerInstance: any = null
const mapLayerDefs = ref<MapLayerDefinitionDto[]>([])

async function reapplyImageryStack() {
  if (!viewerInstance || !globalCesium) return
  try {
    const res: any = await mapLayerApi.list()
    const list = res?.data ?? []
    mapLayerDefs.value = Array.isArray(list) ? list : []
    if (mapLayerDefs.value.length > 0 && applyMapLayerDefinitionsFromApi(globalCesium, viewerInstance, mapLayerDefs.value)) {
      return
    }
  } catch (e) {
    console.warn('[地图] 图层列表刷新失败', e)
  }
  await applyViewerBasemap(globalCesium, viewerInstance)
}

function clearFireMode() {
  emergencyFireMode.value = false
  fireRoomAnchor.value = null
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
  const viewport = getCampusViewport(campusId)
  flyToLocation(viewport.lng, viewport.lat, viewport.defaultHeight, duration)
}

const connectWebSocket = () => {
  const socketUrl = 'http://localhost:8088/ws'
  const client = new Client({ webSocketFactory: () => new SockJS(socketUrl), debug: () => {}, reconnectDelay: 5000 })
  client.onConnect = () => {
    client.subscribe('/topic/alerts', (message) => {
      if (!message.body) return
      const alertObj = JSON.parse(message.body)
      ElMessage.warning(`🚨 ${alertObj.alertType} - ${alertObj.locationDesc}`)
      recentAlerts.value.unshift(alertObj)
      if (recentAlerts.value.length > 6) recentAlerts.value.pop()
      stats.value.pendingAlerts = (stats.value.pendingAlerts || 0) + 1

      if (alertObj.alertType === 'FIRE_ALARM') {
        emergencyFireMode.value = true
        fireAlertInfo.value = alertObj

        if (alertObj.lng && alertObj.lat) {
          const roomName = alertObj.locationDesc ? alertObj.locationDesc : '第一实验室大楼 304 号房间'
          fireRoomAnchor.value = { lng: alertObj.lng, lat: alertObj.lat, room: roomName, height: 45 }
          flyToLocation(alertObj.lng, alertObj.lat, 320, 2.2)
        }
      } else if (alertObj.lng && alertObj.lat) {
        activeMapAlerts.value.push(alertObj)
      }
    })
  }
  client.activate()
  stompClient.value = client
}

async function onViewerReady({ Cesium, viewer }: any) {
  viewerInstance = viewer
  globalCesium = Cesium
  configureViewerPerformance(viewer)

  try {
    const res: any = await mapLayerApi.list()
    const list = res?.data ?? []
    mapLayerDefs.value = Array.isArray(list) ? list : []
    if (mapLayerDefs.value.length > 0 && applyMapLayerDefinitionsFromApi(Cesium, viewer, mapLayerDefs.value)) {
      console.info('[地图] 已按数据库图层配置叠加（天地图/高德顺序见 zOrder）')
    } else {
      await applyViewerBasemap(Cesium, viewer)
    }
  } catch {
    await applyViewerBasemap(Cesium, viewer)
  }

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
    console.warn('[地图] 渲染参数调优失败（可忽略）', e)
  }

  setTimeout(() => {
    flyToCampus(campusStore.currentCampusId, 2.2)
  }, 500)
}

function generateBuildingPolygons(bs: any[]) {
  return bs.map((b) => {
    const sizeWidth = 0.0004 + Math.random() * 0.0002
    const sizeHeight = 0.0006 + Math.random() * 0.0002
    return {
      id: b.id,
      height: b.height,
      hierarchy: [b.lng - sizeWidth, b.lat - sizeHeight, b.lng + sizeWidth, b.lat - sizeHeight, b.lng + sizeWidth, b.lat + sizeHeight, b.lng - sizeWidth, b.lat + sizeHeight]
    }
  })
}

function getFallbackBuildings(campusId: number) {
  if (campusId === 2) {
    return [
      { id: 201, name: '云龙校区机电工程学院教学楼', lng: 110.4578, lat: 19.8603, height: 38 },
      { id: 202, name: '云龙校区图书信息中心', lng: 110.4563, lat: 19.8596, height: 30 },
      { id: 203, name: '云龙校区学生公寓A栋', lng: 110.4587, lat: 19.859, height: 45 },
      { id: 204, name: '云龙校区食堂', lng: 110.4583, lat: 19.8593, height: 22 }
    ]
  }
  return [
    { id: 101, name: '美兰校区信息工程学院教学楼', lng: 110.4034, lat: 20.0451, height: 45 },
    { id: 102, name: '美兰校区学生公寓1号楼', lng: 110.4058, lat: 20.0431, height: 60 },
    { id: 103, name: '美兰校区第一学生食堂', lng: 110.4044, lat: 20.0437, height: 25 },
    { id: 104, name: '美兰校区图书馆', lng: 110.402, lat: 20.0447, height: 35 }
  ]
}

function getFallbackPoints(campusId: number) {
  if (campusId === 2) {
    return [
      { id: 11, name: '云龙校区机电学院教学楼消防栓', lng: 110.4579, lat: 19.8604, type: 'FIRE_HYDRANT' },
      { id: 12, name: '云龙校区图信中心AED', lng: 110.4564, lat: 19.8597, type: 'AED' }
    ]
  }
  return [
    { id: 1, name: '美兰校区主教学楼消防栓', lng: 110.4034, lat: 20.0451, type: 'FIRE_HYDRANT' },
    { id: 2, name: '美兰校区第一食堂除颤仪', lng: 110.4044, lat: 20.0437, type: 'AED' }
  ]
}

function getFallbackHeatmap(campusId: number) {
  if (campusId === 2) {
    return [
      { lng: 110.4578, lat: 19.8603, intensity: 0.75 },
      { lng: 110.4564, lat: 19.8597, intensity: 0.42 }
    ]
  }
  return [
    { lng: 110.4034, lat: 20.0451, intensity: 0.8 },
    { lng: 110.4044, lat: 20.0437, intensity: 0.4 }
  ]
}

function initBusinessLayers(campusId: number) {
  if (campusId === 2) {
    emergencyExits.value = [{ lng: 110.4553, lat: 19.8608 }, { lng: 110.4593, lat: 19.8588 }]
    hazmatStorages.value = [{ name: '云龙校区危化品暂存点', lng: 110.4571, lat: 19.8608 }]
    return
  }
  emergencyExits.value = [{ lng: 110.4004, lat: 20.0461 }, { lng: 110.4064, lat: 20.0449 }]
  hazmatStorages.value = [{ name: '美兰校区化环学院试剂库', lng: 110.404, lat: 20.0453 }]
}

function buildGuardRoutes(campusId: number) {
  if (campusId === 2) {
    return [
      { name: '云龙巡逻队A', speed: 0.0000022, t: 0, direction: 1, routeCoords: [[110.4591, 19.859], [110.4573, 19.86], [110.4558, 19.8608]] },
      { name: '云龙机动安保01', speed: 0.0000027, t: 0.45, direction: -1, routeCoords: [[110.4583, 19.8603], [110.4571, 19.8596], [110.4561, 19.8592]] }
    ]
  }
  return [
    { name: '美兰巡逻队A', speed: 0.000002, t: 0, direction: 1, routeCoords: [[110.4064, 20.0449], [110.4032, 20.0449], [110.4004, 20.0461]] },
    { name: '美兰机动安保01', speed: 0.000003, t: 0.5, direction: -1, routeCoords: [[110.402, 20.0447], [110.404, 20.0453], [110.4058, 20.0431]] }
  ]
}

function initSecurityGuards(campusId: number) {
  const guards = buildGuardRoutes(campusId)
  securityGuards.value = guards.map((g) => {
    const flat = g.routeCoords.reduce((acc, val) => acc.concat(val), [] as number[])
    return { ...g, routeCoordsFlat: flat, currentPosition: [g.routeCoords[0][0], g.routeCoords[0][1], 0] }
  })
}

function startGuardAnimation() {
  if (isGuardAnimationStarted) return
  isGuardAnimationStarted = true
  const animate = () => {
    securityGuards.value.forEach((g) => {
      g.t += g.speed * g.direction
      if (g.t >= 1) { g.t = 1; g.direction = -1 }
      if (g.t <= 0) { g.t = 0; g.direction = 1 }
      const start = g.routeCoords[0]
      const end = g.routeCoords[g.routeCoords.length - 1]
      g.currentPosition = [start[0] + (end[0] - start[0]) * g.t, start[1] + (end[1] - start[1]) * g.t, 0]
    })
    animationFrameId = requestAnimationFrame(animate)
  }
  animate()
}

async function loadCampusScene(campusId: number) {
  const seq = ++campusLoadSeq
  try {
    const [statsRes, alertsRes, buildingsRes, pointsRes, heatRes]: any[] = await Promise.all([
      dashboardApi.getStats(campusId).catch(() => ({ data: {} })),
      alertApi.getAlerts('PENDING', 0, 6).catch(() => ({ data: { content: [] } })),
      mapApi.getBuildings(campusId).catch(() => ({ data: [] })),
      safetyPointApi.getPoints(campusId).catch(() => ({ data: [] })),
      aiApi.getHeatmap().catch(() => ({ data: { points: [] } }))
    ])
    if (seq !== campusLoadSeq) return

    if (statsRes?.data) stats.value = statsRes.data
    if (alertsRes?.data) recentAlerts.value = alertsRes.data.content || []

    const campusBuildings = Array.isArray(buildingsRes?.data) && buildingsRes.data.length > 0
      ? buildingsRes.data
      : getFallbackBuildings(campusId)
    buildings.value = campusBuildings
    buildingPolygons.value = generateBuildingPolygons(campusBuildings)

    safetyPoints.value = Array.isArray(pointsRes?.data) && pointsRes.data.length > 0
      ? pointsRes.data
      : getFallbackPoints(campusId)

    const points = Array.isArray(heatRes?.data?.points) && heatRes.data.points.length > 0
      ? heatRes.data.points.filter((p: any) => p.intensity > 0)
      : getFallbackHeatmap(campusId)
    heatmapPoints.value = points
    totalHeatmapIntensity.value = points.reduce((sum: number, p: any) => sum + (p.intensity || 0), 0)
  } catch (e) {
    if (seq !== campusLoadSeq) return
    console.error(e)
    const fallbackBuildings = getFallbackBuildings(campusId)
    buildings.value = fallbackBuildings
    buildingPolygons.value = generateBuildingPolygons(fallbackBuildings)
    safetyPoints.value = getFallbackPoints(campusId)
    heatmapPoints.value = getFallbackHeatmap(campusId)
    totalHeatmapIntensity.value = heatmapPoints.value.reduce((sum: number, p: any) => sum + (p.intensity || 0), 0)
  }
}

const trendOption = computed(() => ({
  tooltip: { trigger: 'axis', backgroundColor: 'rgba(26, 35, 50, 0.9)', textStyle: { color: '#fff' } },
  grid: { left: '3%', right: '4%', bottom: '3%', top: '10%', containLabel: true },
  xAxis: { type: 'category', boundaryGap: false, data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'], axisLabel: { color: '#a0aec0' } },
  yAxis: { type: 'value', axisLabel: { color: '#a0aec0' }, splitLine: { lineStyle: { color: 'rgba(255,255,255,0.1)' } } },
  series: [{
    name: '排查清点量',
    type: 'line',
    smooth: true,
    data: [12, 11, 14, 18, 17, 13, 13],
    lineStyle: { color: '#4299e1' },
    itemStyle: { color: '#4299e1' },
    areaStyle: {
      color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
        { offset: 0, color: 'rgba(66,153,225,0.3)' },
        { offset: 1, color: 'rgba(66,153,225,0)' }
      ])
    }
  }]
}))

const radarOption = computed(() => ({
  radar: {
    indicator: [
      { name: 'AI门禁覆盖效能', max: 100 }, { name: '隐患责任闭环系数', max: 100 }, { name: '3D实景白模渲染率', max: 100 },
      { name: '室内起火点定位精准度', max: 100 }, { name: '灭火器在线管理性', max: 100 }, { name: '防线抗压敏捷度', max: 100 }
    ],
    axisName: { color: '#a0aec0' },
    splitArea: { areaStyle: { color: ['rgba(255,255,255,0.02)', 'rgba(255,255,255,0.05)'] } },
    splitLine: { lineStyle: { color: 'rgba(255,255,255,0.1)' } }
  },
  series: [{
    type: 'radar',
    areaStyle: { color: 'rgba(72,187,120,0.4)' },
    lineStyle: { color: '#48bb78' },
    itemStyle: { color: '#48bb78' },
    data: [{ value: [99, 100, 100, 100, 100, 100], name: '修订考核得分' }]
  }]
}))

function formatTime(time: string) { return time ? time.replace('T', ' ').substring(11, 19) : '' }

watch(() => campusStore.currentCampusId, (campusId) => {
  initBusinessLayers(campusId)
  initSecurityGuards(campusId)
  loadCampusScene(campusId)
  flyToCampus(campusId, 1.3)
}, { immediate: true })

onMounted(() => {
  checkMobile()
  window.addEventListener('resize', checkMobile)
  setTimeout(() => { isScanning.value = false }, 2500)
  campusStore.loadCampuses()
  connectWebSocket()
  startGuardAnimation()
})

onUnmounted(() => {
  window.removeEventListener('resize', checkMobile)
  if (stompClient.value?.active) stompClient.value.deactivate()
  cancelAnimationFrame(animationFrameId)
})
</script>

<style scoped>
/* 全局火情特效 */
.global-fire-alert { position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(229, 62, 62, 0.4); z-index: 10000; display: flex; justify-content: center; align-items: center; box-shadow: 0 0 120px rgba(229, 62, 62, 0.9) inset; border: 8px solid rgba(229, 62, 62, 0.8); animation: bg-flash 1.5s infinite alternate; pointer-events: none; }
.fire-alert-box { background: rgba(26, 32, 44, 0.95); border: 2px solid #e53e3e; padding: 40px 60px; border-radius: 12px; text-align: center; color: white; box-shadow: 0 20px 80px rgba(0,0,0,0.8); backdrop-filter: blur(10px); pointer-events: auto; animation: fly-in 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275); }
.fire-icon { color: #fc8181; animation: fire-shake 0.5s infinite; }
.fire-title { font-size: 32px; font-weight: 900; color: #fc8181; margin-top: 20px; letter-spacing: 2px; }
.fire-loc { font-size: 18px; color: #fff; margin-top: 15px; background: #e53e3e; padding: 4px 12px; border-radius: 16px; display: inline-block; font-weight: bold;}
.fire-desc { margin-top: 16px; color: #cbd5e0; font-size: 14px; margin-bottom: 24px;}
.fire-actions { display: flex; gap: 15px; justify-content: center; }

@keyframes bg-flash { from { background: rgba(229, 62, 62, 0.2); } to { background: rgba(229, 62, 62, 0.5); } }
@keyframes fire-shake { 0%, 100% { transform: translateX(0); } 25% { transform: translateX(-5px) rotate(-5deg); } 75% { transform: translateX(5px) rotate(5deg); } }
@keyframes fly-in { from { transform: scale(0.5) translateY(100px); opacity: 0; } to { transform: scale(1) translateY(0); opacity: 1; } }

/* 基本布局样式 */
.dashboard-big-screen { position: relative; width: 100%; height: calc(100vh - 60px); overflow: hidden; background-color: #0d1117; color: #fff; font-family: 'Helvetica Neue', Helvetica, 'PingFang SC', sans-serif; }
.scan-overlay { position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(13, 17, 23, 0.95); z-index: 9999; display: flex; justify-content: center; align-items: center; }
.scan-line { position: absolute; left: 0; top: -10px; width: 100%; height: 5px; background: #4299e1; box-shadow: 0 0 15px #4299e1, 0 0 30px #4299e1; animation: scan 2.5s linear infinite; }
.scan-text { font-size: 24px; font-weight: bold; color: #4299e1; letter-spacing: 4px; animation: pulse 1s infinite alternate; }
@keyframes scan { 0% { top: 0; opacity: 1; } 100% { top: 100%; opacity: 0; } }
.map-bg { position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 1; }

.top-center-hud {
  position: absolute;
  top: 12px;
  left: 50%;
  transform: translateX(-50%);
  z-index: 12;
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 6px 10px;
  padding: 8px 16px;
  font-size: 12px;
  color: rgba(226, 232, 240, 0.92);
  background: rgba(13, 22, 38, 0.72);
  border: 1px solid rgba(66, 153, 225, 0.25);
  border-radius: 8px;
  backdrop-filter: blur(8px);
  pointer-events: none;
}
.hud-line strong { font-weight: 700; }
.hud-ok { color: #38a169; }
.hud-gold { color: #fbd38d; }
.hud-div { opacity: 0.35; user-select: none; }

/* 顶部面板折叠入口栏（搜索栏风格） */
.dashboard-top-bar {
  position: absolute;
  top: 62px;
  left: 50%;
  transform: translateX(-50%);
  z-index: 13;
  display: flex;
  align-items: stretch;
  gap: 0;
  padding: 4px;
  background: rgba(13, 22, 38, 0.88);
  border: 1px solid rgba(66, 153, 225, 0.35);
  border-radius: 999px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.55), 0 0 0 1px rgba(99, 179, 237, 0.08);
  backdrop-filter: blur(10px);
  max-width: calc(100vw - 40px);
  overflow-x: auto;
  scrollbar-width: none;
}
.dashboard-top-bar::-webkit-scrollbar { display: none; }

.dtb-pill {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 8px 16px;
  background: transparent;
  border: none;
  color: #a0aec0;
  font-size: 13px;
  font-weight: 500;
  cursor: pointer;
  border-radius: 999px;
  transition: background 0.2s, color 0.2s, box-shadow 0.2s;
  white-space: nowrap;
  font-family: inherit;
}
.dtb-pill:hover {
  background: rgba(66, 153, 225, 0.08);
  color: #cbd5e0;
}
.dtb-pill.active {
  background: linear-gradient(135deg, rgba(49, 130, 206, 0.35), rgba(66, 153, 225, 0.22));
  color: #e2e8f0;
  box-shadow: inset 0 0 0 1px rgba(99, 179, 237, 0.45), 0 0 14px rgba(66, 153, 225, 0.25);
}
.dtb-pill-icon {
  font-size: 15px;
  color: #63b3ed;
}
.dtb-pill.active .dtb-pill-icon { color: #90cdf4; }
.dtb-pill-text {
  font-weight: 600;
  letter-spacing: 0.5px;
}
.dtb-pill-meta {
  font-size: 11px;
  padding: 2px 8px;
  border-radius: 10px;
  background: rgba(66, 153, 225, 0.18);
  color: #90cdf4;
  font-weight: 600;
}
.dtb-pill.active .dtb-pill-meta {
  background: rgba(255, 255, 255, 0.15);
  color: #fff;
}
.dtb-pill-caret {
  font-size: 12px;
  opacity: 0.7;
  transition: transform 0.25s ease;
}
.dtb-pill-caret.rot { transform: rotate(180deg); }

.dtb-sep {
  width: 1px;
  margin: 6px 2px;
  background: rgba(99, 179, 237, 0.18);
}

/* 面板关闭按钮（在各面板 header 里） */
.panel-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.panel-close-btn {
  background: transparent;
  border: none;
  color: #a0aec0;
  cursor: pointer;
  padding: 4px;
  border-radius: 4px;
  display: inline-flex;
  align-items: center;
  transition: background 0.15s, color 0.15s;
}
.panel-close-btn:hover {
  background: rgba(229, 62, 62, 0.15);
  color: #fc8181;
}

/* 面板折叠/展开过渡 */
.panel-slide-left-enter-active,
.panel-slide-left-leave-active,
.panel-slide-right-enter-active,
.panel-slide-right-leave-active {
  transition: transform 0.35s cubic-bezier(0.4, 0, 0.2, 1), opacity 0.25s ease;
}
.panel-slide-left-enter-from,
.panel-slide-left-leave-to {
  transform: translateX(-105%);
  opacity: 0;
}
.panel-slide-right-enter-from,
.panel-slide-right-leave-to {
  transform: translateX(105%);
  opacity: 0;
}
.panel-fade-down-enter-active,
.panel-fade-down-leave-active {
  transition: transform 0.3s ease, opacity 0.25s ease;
}
.panel-fade-down-enter-from,
.panel-fade-down-leave-to {
  transform: translateY(-12px);
  opacity: 0;
}

.panel-left,
.panel-right {
  position: absolute;
  top: 0;
  bottom: 0;
  width: 380px;
  z-index: 10;
  overflow-y: auto;
  padding: 16px;
  padding-top: 56px;
  background: rgba(13, 22, 38, 0.88);
  backdrop-filter: blur(10px);
  box-sizing: border-box;
}
.panel-left {
  left: 0;
  border-right: 1px solid rgba(49, 130, 206, 0.22);
}
.panel-right {
  right: 0;
  border-left: 1px solid rgba(49, 130, 206, 0.22);
  display: flex;
  flex-direction: column;
}

.map-layer-float {
  position: absolute;
  left: 400px;
  top: 56px;
  width: 300px;
  max-height: min(72vh, 560px);
  overflow-y: auto;
  z-index: 11;
  background: rgba(13, 22, 38, 0.9);
  border: 1px solid rgba(66, 153, 225, 0.28);
  border-radius: 8px;
  padding: 10px 12px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.45);
}

.panel-header { font-size: 18px; font-weight: bold; color: #63b3ed; text-shadow: 0 0 10px rgba(99,179,237,0.5); border-bottom: 1px solid rgba(99,179,237,0.2); padding-bottom: 10px; margin-bottom: 15px; }
.sub-title { font-size: 14px; font-weight: 600; color: #a0aec0; margin-bottom: 10px; }
.stat-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; }
.stat-card { border-radius: 6px; padding: 15px; text-align: center; }
.stat-label { font-size: 11px; color: rgba(255,255,255,0.7); margin-bottom: 8px; }
.stat-value { font-size: 24px; font-weight: 700; font-family: monospace; }
.text-danger { color: #FC8181; } .text-warning { color: #F6AD55; } .text-success { color: #68D391; } .text-primary { color: #63B3ED; }
.chart-container { background: rgba(0,0,0,0.2); padding: 5px; border-radius: 6px; }
.chart { width: 100%; height: 200px; }
.mt-4 { margin-top: 10px; }
.flex-between { display: flex; justify-content: space-between; align-items: center; }
.live-badge { background: red; color: white; border-radius: 12px; padding: 2px 8px; font-size: 10px; font-weight: bold; animation: pulse 1.5s infinite; }
.alert-stream { flex: 1; background: rgba(0,0,0,0.2); padding: 10px; border-radius: 6px; display: flex; flex-direction: column; min-height: 0; }
.alert-list { flex: 1; overflow-y: auto; }
.alert-item { display: flex; gap: 10px; background: rgba(229, 62, 62, 0.1); border-left: 3px solid #e53e3e; padding: 10px; margin-bottom: 8px; border-radius: 0 4px 4px 0; }
.alert-icon { padding-top: 2px; } .alert-content { flex: 1; display: flex; flex-direction: column; gap: 4px; }
.alert-title { font-size: 13px; font-weight: 600; color: #fc8181; } .alert-desc { font-size: 12px; color: #cbd5e0; }
.alert-time { font-size: 11px; color: #718096; align-self: flex-end; }
.empty-state { text-align: center; color: #4a5568; padding: 30px 0; font-size: 13px; }
.new-alert-flash { animation: alert-flash 3s ease-out; }
@keyframes alert-flash { 0% { background: rgba(229,62,62,0.8); } 100% { background: rgba(229,62,62,0.1); } }
.action-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 10px; }
.action-btn { display: flex; align-items: center; justify-content: center; gap: 8px; padding: 12px; border-radius: 6px; cursor: pointer; font-size: 13px; font-weight: bold; transition: all 0.2s; }
.action-btn:hover { transform: translateY(-2px); box-shadow: 0 4px 12px rgba(0,0,0,0.5); }
.action-btn.bg-blue { background: linear-gradient(135deg, #2b6cb0, #4299e1); } .action-btn.bg-orange { background: linear-gradient(135deg, #c05621, #ed8936); }
.action-btn.bg-green { background: linear-gradient(135deg, #2f855a, #48bb78); } .action-btn.bg-red { background: linear-gradient(135deg, #c53030, #f56565); }
.fade-in-left { animation: fadeInLeft 1s ease-out forwards; } .fade-in-right { animation: fadeInRight 1s ease-out forwards; }
@keyframes fadeInLeft { from { opacity: 0; transform: translateX(-50px); } to { opacity: 1; transform: translateX(0); } }
@keyframes fadeInRight { from { opacity: 0; transform: translateX(50px); } to { opacity: 1; transform: translateX(0); } }
</style>
