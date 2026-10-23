<template>
  <div class="monitor-page fade-in-up">
    <!-- 顶栏状态与控制 -->
    <div class="monitor-header">
      <div class="header-title">
        <el-icon :size="24" color="#4299e1"><VideoCameraFilled /></el-icon>
        <span>多源立体预警 - 全网无感 AI 智能分析与门禁集群</span>
      </div>
      <div class="header-stats">
        <el-tag effect="dark" type="success">视频设备在线: 99%</el-tag>
        <el-tag effect="dark" type="primary" class="ml-2">数字门禁闸机: 14/14</el-tag>
        <el-tag effect="dark" type="warning" class="ml-2">活跃打架/翻墙拦截: {{ captureLogs.length }}</el-tag>
      </div>
    </div>

    <div class="monitor-layout">
      <!-- 左侧：多路视频分屏墙 (2.1 视频网) -->
      <div class="video-wall" :class="fullscreenCam !== null ? 'grid-1x1' : 'grid-2x2'">
        <div v-for="(cam, idx) in visibleCameras" :key="idx" class="video-cell" :class="{ 'alarm-flash': cam.isAlaram }">
          <div class="cam-info">
            <span class="cam-name"><span class="live-dot"></span> {{ cam.name }}</span>
            <div class="cam-actions">
              <span class="cam-status">{{ cam.status }}</span>
              <el-button v-if="fullscreenCam === null" link size="small" style="color:#63b3ed" @click="enterFullscreen(idx)">⛶</el-button>
              <el-button v-else link size="small" style="color:#63b3ed" @click="exitFullscreen">✕</el-button>
            </div>
          </div>
          <!-- 视频画面替身 -->
          <div class="video-player">
            <div class="video-placeholder" :style="{ background: cam.bg }"></div>
            <!-- AI 分析动态画框 -->
            <div
              v-if="cam.aiBox" class="ai-bounding-box"
              :style="{ left: cam.aiBox.x + '%', top: cam.aiBox.y + '%', width: cam.aiBox.w + '%', height: cam.aiBox.h + '%' }"
            >
              <div class="ai-label">{{ cam.aiBox.label }} {{ cam.aiBox.confidence }}%</div>
            </div>
            <!-- 时间戳水印 -->
            <div class="cam-timestamp">{{ currentTime }}</div>
          </div>
        </div>
      </div>

      <!-- 右侧双路面板：门禁流 & 异常抓拍事件流 -->
      <div class="side-panel-wrapper">
        <!-- 录像回放时间轴 -->
        <div class="playback-panel">
          <div class="panel-head">
            <span>🕐 录像回放时间轴</span>
            <el-tag :type="isLive ? 'danger' : 'info'" size="small" effect="dark" style="cursor:pointer" @click="isLive = !isLive">
              {{ isLive ? '● LIVE' : '⏪ 回放' }}
            </el-tag>
          </div>
          <div class="playback-body">
            <el-slider v-model="playbackHour" :min="0" :max="23" :step="1"
              :format-tooltip="(v: number) => `${String(v).padStart(2,'0')}:00`"
              :disabled="isLive" :marks="playbackMarks" style="margin: 0 10px;"
            />
          </div>
        </div>

        <!-- 门禁打卡流水 (2.1 补漏：门禁打通) -->
        <div class="access-logs-panel">
          <div class="panel-head">
            <span>🛂 校园门禁进出通行流</span>
            <span style="font-size:12px;color:#a0aec0;font-weight:normal">今日通行: 13,042 人次</span>
          </div>
          <div class="panel-body">
            <transition-group name="list" tag="div" class="log-list">
              <div v-for="ac in accessLogs" :key="ac.id" class="access-item">
                 <div class="ac-avatar"><el-icon size="18" color="#63b3ed"><UserFilled/></el-icon></div>
                 <div class="ac-info">
                    <div class="ac-name">{{ ac.name }} <span class="ac-role">{{ ac.role }}</span></div>
                    <div class="ac-time">{{ ac.device }} - {{ ac.time }}</div>
                 </div>
                 <div class="ac-res" :class="ac.pass ? 'pass' : 'reject'">{{ ac.pass ? '放行' : '识别拦截' }}</div>
              </div>
            </transition-group>
          </div>
        </div>

        <!-- AI 实况抓拍报警流 -->
        <div class="ai-logs-panel">
          <div class="panel-head">
            <span>🔴 AI 安防违规抓拍库</span>
            <el-button size="small" type="primary" plain @click="clearLogs">库清空</el-button>
          </div>
          <div class="panel-body">
            <transition-group name="list" tag="div" class="log-list">
              <div v-for="log in captureLogs" :key="log.id" class="log-item">
                <div class="log-time">{{ log.time }}</div>
                <div class="log-detail">
                  <span class="log-cam">[{{ log.camera }}]</span>
                  <span class="log-event" :class="'text-' + log.level">{{ log.event }}</span>
                </div>
                <div class="log-actions">
                  <span class="log-action">⚡ 系统已拦截并自动派警</span>
                  <el-button size="small" type="warning" plain @click="createEventFromLog(log)" style="margin-left:8px;">
                    📋 创建事件
                  </el-button>
                  <el-button size="small" type="primary" link @click="locateOnMap(log)" style="margin-left:4px;">
                    📍 定位
                  </el-button>
                </div>
              </div>
            </transition-group>
            <div v-if="captureLogs.length === 0" class="empty-log">暂无安全违规异常</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { alertApi, eventApi } from '../api'

const router = useRouter()

const cameras = ref([
  { name: 'CAM-01 东北角外围栅栏', status: '✅ DAHUA-H.265 热像', bg: 'linear-gradient(45deg, #1a202c, #2d3748)', isAlaram: false, aiBox: null as any, lng: 110.3340, lat: 20.0595 },
  { name: 'CAM-02 化学大楼一层走廊', status: '✅ HIKVISION-智能', bg: 'linear-gradient(45deg, #2d3748, #4a5568)', isAlaram: false, aiBox: null as any, lng: 110.3315, lat: 20.0592 },
  { name: 'CAM-03 学生宿舍3栋中庭', status: '✅ HIKVISION-全彩', bg: 'linear-gradient(45deg, #1a202c, #2c5282)', isAlaram: false, aiBox: null as any, lng: 110.3338, lat: 20.0565 },
  { name: 'CAM-04 第一食堂后厨库房', status: '✅ DAHUA-全局光照', bg: 'linear-gradient(45deg, #4a5568, #2d3748)', isAlaram: false, aiBox: null as any, lng: 110.3320, lat: 20.0575 }
])

const captureLogs = ref<any[]>([])
const accessLogs = ref<any[]>([])
const fullscreenCam = ref<number | null>(null)
const isLive = ref(true)
const playbackHour = ref(new Date().getHours())
const currentTime = ref('')
let aiInterval: number
let accessInterval: number
let timeInterval: number

const playbackMarks: Record<number, string> = { 0: '00', 6: '06', 12: '12', 18: '18', 23: '23' }

const visibleCameras = computed(() => {
  if (fullscreenCam.value !== null) return [cameras.value[fullscreenCam.value]]
  return cameras.value
})

function enterFullscreen(idx: number) { fullscreenCam.value = idx }
function exitFullscreen() { fullscreenCam.value = null }
function updateTime() { currentTime.value = new Date().toLocaleTimeString('zh-CN', { hour12: false }) }

const aiEvents = [
  { camIdx: 0, label: '❗翻墙入侵警戒线', conf: 94, level: 'danger', type: 'SECURITY' },
  { camIdx: 1, label: '🔥不明烟雾散布', conf: 89, level: 'danger', type: 'FIRE_ALARM' },
  { camIdx: 2, label: '🚶可疑夜间逗留', conf: 85, level: 'warning', type: 'SECURITY' },
  { camIdx: 3, label: '⚠️剧烈运动(人群聚集打架)', conf: 82, level: 'danger', type: 'SOS' }
]

const fakeNames = ['张三', '李四', '王晓', '韩梅梅', '外来人员(无权限)', '孙教授', '刘师傅']
const fakeRoles = ['计算机系(学生)', '物理系(学生)', '保卫处(职工)', '计算机系(学生)', '未注册人脸', '化学系(主任)', '食堂(后勤)']
const accessGates = ['东门一号人脸道闸', '图书馆前置门禁', '宿舍3栋人脸门', '化学实验室密码门']

function formatTimeStr(d: Date) { return d.toTimeString().split(' ')[0] }
function clearLogs() { captureLogs.value = [] }

async function triggerRandomAI() {
  const eventDef = aiEvents[Math.floor(Math.random() * aiEvents.length)]
  const cam = cameras.value[eventDef.camIdx]

  cam.aiBox = { x: 20 + Math.random() * 40, y: 20 + Math.random() * 40, w: 15 + Math.random() * 15, h: 30 + Math.random() * 20, label: eventDef.label, confidence: eventDef.conf + Math.floor(Math.random() * 10) }
  cam.isAlaram = true

  captureLogs.value.unshift({
    id: Date.now(), time: formatTimeStr(new Date()),
    camera: cam.name, event: eventDef.label + ' (置信度 ' + cam.aiBox.confidence + '%)', level: eventDef.level,
    camIdx: eventDef.camIdx, type: eventDef.type
  })
  if (captureLogs.value.length > 50) captureLogs.value.pop()

  try {
    await alertApi.sendSos({ alertType: eventDef.type, lng: cam.lng + Math.random()*0.001, lat: cam.lat + Math.random()*0.001, locationDesc: `摄像机抓拍防范: ${cam.name}`, content: `AI安防大模型检测到【${eventDef.label}】，已自动立案。`})
  } catch(e) { }

  setTimeout(() => { cam.aiBox = null; cam.isAlaram = false }, 3500)
}

function simulateAccessLine() {
  const idx = Math.floor(Math.random() * fakeNames.length)
  const isReject = fakeNames[idx].includes('外来')
  accessLogs.value.unshift({
     id: Date.now(),
     name: fakeNames[idx], role: fakeRoles[idx], device: accessGates[Math.floor(Math.random()*accessGates.length)],
     time: formatTimeStr(new Date()), pass: !isReject
  })
  if (accessLogs.value.length > 15) accessLogs.value.pop()
}

async function createEventFromLog(log: any) {
  const cam = cameras.value[log.camIdx] || cameras.value[0]
  const typeMap: Record<string, string> = { FIRE_ALARM: 'FIRE', SECURITY: 'VIOLENCE', SOS: 'OTHER' }
  try {
    const res: any = await eventApi.createEvent({
      title: `[AI抓拍] ${log.event.replace(/\s*\(置信度.*\)/, '')}`,
      type: typeMap[log.type] || 'OTHER',
      severity: log.level === 'danger' ? 'HIGH' : 'MEDIUM',
      locationDesc: cam.name,
      description: `AI视频监控系统于 ${log.time} 在 ${cam.name} 检测到异常行为：${log.event}。系统已自动创建事件进行跟踪处理。`,
      lng: cam.lng,
      lat: cam.lat,
      campusId: 1
    })
    if (res.code === 200) {
      ElMessage.success('已从 AI 抓拍自动创建安全事件，进入事件管理跟踪')
    }
  } catch {
    ElMessage.error('创建事件失败')
  }
}

function locateOnMap(log: any) {
  const cam = cameras.value[log.camIdx] || cameras.value[0]
  router.push({ path: '/map', query: { lng: cam.lng, lat: cam.lat, zoom: 18 } })
}

onMounted(() => {
  updateTime()
  timeInterval = window.setInterval(updateTime, 1000)
  const loopAI = () => { aiInterval = window.setTimeout(() => { triggerRandomAI(); loopAI() }, 7000 + Math.random() * 8000) }
  const loopAccess = () => { accessInterval = window.setTimeout(() => { simulateAccessLine(); loopAccess() }, 2000 + Math.random() * 3000) }

  loopAI()
  simulateAccessLine(); simulateAccessLine(); loopAccess()
})

onUnmounted(() => {
  clearTimeout(aiInterval)
  clearTimeout(accessInterval)
  clearInterval(timeInterval)
})
</script>

<style scoped>
.monitor-page { display: flex; flex-direction: column; height: calc(100vh - 120px); gap: 16px; }
.monitor-header { display: flex; justify-content: space-between; align-items: center; background: var(--bg-card); padding: 16px 24px; border-radius: 8px; border: 1px solid var(--border-color); }
.header-title { display: flex; align-items: center; gap: 12px; font-size: 18px; font-weight: bold; color: var(--text-primary); }
.ml-2 { margin-left: 8px; }
.monitor-layout { flex: 1; display: flex; gap: 16px; min-height: 0; }
.video-wall { flex: 2.2; display: grid; gap: 12px; }
.grid-2x2 { grid-template-columns: 1fr 1fr; grid-template-rows: 1fr 1fr; }
.grid-1x1 { grid-template-columns: 1fr; grid-template-rows: 1fr; }
.video-cell { background: #000; border-radius: 8px; overflow: hidden; position: relative; border: 2px solid transparent; transition: border-color 0.3s; }
.alarm-flash { border-color: #e53e3e; animation: flashRed 1s infinite alternate; }
@keyframes flashRed { 0% { box-shadow: 0 0 10px rgba(229,62,62,0.8) inset; } 100% { box-shadow: 0 0 40px rgba(229,62,62,0.2) inset; } }
.cam-info { position: absolute; top: 10px; left: 10px; right: 10px; z-index: 10; display: flex; justify-content: space-between; text-shadow: 1px 1px 2px #000; }
.cam-name { font-weight: bold; font-size: 14px; }
.cam-status { font-family: monospace; font-size: 12px; color: #68d391; }
.cam-actions { display: flex; align-items: center; gap: 8px; }
.live-dot { display: inline-block; width: 8px; height: 8px; background: #e53e3e; border-radius: 50%; margin-right: 4px; animation: pulse 1s infinite; }
@keyframes pulse { 0%,100% { opacity:1; } 50% { opacity:0.3; } }
.video-player { width: 100%; height: 100%; position: relative; }
.video-placeholder { width: 100%; height: 100%; opacity: 0.8; position: relative; overflow: hidden; }
.video-placeholder::after { content: ''; position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: repeating-linear-gradient(0deg, rgba(255,255,255,0.03) 0px, rgba(255,255,255,0.03) 1px, transparent 1px, transparent 4px); pointer-events: none; }
.cam-timestamp { position: absolute; bottom: 10px; right: 10px; font-family: monospace; font-size: 13px; color: rgba(255,255,255,0.7); text-shadow: 1px 1px 2px #000; }
.ai-bounding-box { position: absolute; border: 2px solid #e53e3e; background: rgba(229,62,62,0.1); box-shadow: 0 0 10px rgba(229,62,62,0.5); transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1); }
.ai-label { position: absolute; top: -24px; left: -2px; background: #e53e3e; color: #fff; font-size: 12px; padding: 2px 6px; font-weight: bold; white-space: nowrap; }

/* 右面板区改造成三层 */
.side-panel-wrapper { flex: 1; display: flex; flex-direction: column; gap: 12px; }
.playback-panel { background: var(--bg-card); border: 1px solid var(--border-color); border-radius: 8px; overflow: hidden; }
.playback-body { padding: 16px 16px 28px; }
.access-logs-panel, .ai-logs-panel { flex: 1; background: var(--bg-card); border: 1px solid var(--border-color); border-radius: 8px; display: flex; flex-direction: column; overflow: hidden; }
.panel-head { padding: 12px 16px; border-bottom: 1px solid var(--border-color); font-weight: bold; display: flex; justify-content: space-between; align-items: center; background: rgba(0,0,0,0.2); }
.panel-body { flex: 1; padding: 10px; overflow-y: auto; }

/* 门禁项样式 */
.access-item { display:flex; align-items:center; gap: 10px; background: rgba(255,255,255,0.02); padding:8px 10px; border-radius:6px; margin-bottom: 6px; border:1px solid rgba(255,255,255,0.04); }
.ac-avatar { width:32px; height:32px; background:#2a4365; border-radius:50%; display:flex; justify-content:center; align-items:center; }
.ac-info { flex:1; display:flex; flex-direction:column; gap:3px;}
.ac-name { font-size:13px; font-weight:bold; }
.ac-role { font-size:11px; color:#a0aec0; margin-left:6px; font-weight:normal;}
.ac-time { font-size:11px; color:#718096;}
.ac-res { font-size:12px; font-weight:bold; padding:2px 6px; border-radius:12px; }
.ac-res.pass { color: #48bb78; background: rgba(72,187,120,0.15); border:1px solid #48bb78; }
.ac-res.reject { color: #f56565; background: rgba(245,101,101,0.15); border:1px solid #f56565; }

/* 日志项样式 */
.log-item { background: rgba(229, 62, 62, 0.05); border: 1px solid rgba(229, 62, 62, 0.2); border-left: 4px solid #e53e3e; border-radius: 4px; padding: 10px; margin-bottom: 8px; display: flex; flex-direction: column; gap: 6px; }
.log-time { font-size: 12px; color: var(--text-secondary); }
.log-detail { font-size: 14px; font-weight: bold; }
.log-cam { color: #63b3ed; margin-right: 8px; }
.text-danger { color: #fc8181; }
.text-warning { color: #fbd38d; }
.log-actions { display: flex; align-items: center; flex-wrap: wrap; }
.log-action { font-size: 12px; color: #e53e3e; font-weight: bold; }
.list-enter-active, .list-leave-active { transition: all 0.5s ease; }
.list-enter-from { opacity: 0; transform: translateX(30px); }
.list-leave-to { opacity: 0; transform: translateY(-30px); }
.empty-log { text-align: center; color: var(--text-secondary); padding: 20px 0; }
</style>
