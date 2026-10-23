<template>
  <div class="alert-page fade-in-up">
    <!-- 业务模式切换（商业演示用：手机APP vs 实体报警柱） -->
    <div class="mode-switch">
      <el-radio-group v-model="deviceMode" size="large">
        <el-radio-button value="app"><el-icon><Phone /></el-icon> 校园学生 APP 端</el-radio-button>
        <el-radio-button value="pillar"><el-icon><LocationInformation /></el-icon> 校园实体一键报警柱</el-radio-button>
      </el-radio-group>
    </div>

    <!-- 核心报警交互区 -->
    <div class="sos-section" :class="{ 'pillar-mode': deviceMode === 'pillar' }">
      <div v-if="deviceMode === 'app'" class="device-label">📱 您的位置: {{ locationObtained ? '已通过 GPS 定位' : '正在获取卫星定位...' }}</div>
      <div v-else class="device-label">📍 设备编号: XY-110-0032 (第二食堂南门)</div>

      <!-- 隐蔽采集录证特效 -->
      <div v-if="isRecording" class="recording-overlay">
        <div class="record-pulse"></div>
        <div class="record-info">
          <div class="blink-rec">● REC</div>
          <div>正在隐蔽静音采集现场音视频证据...</div>
          <div class="rec-progress"><div class="rec-bar"></div></div>
        </div>
      </div>

      <div class="sos-button-wrapper">
        <div class="sos-ripple" v-if="!sending && !isRecording"></div>
        <button class="sos-button" :class="{ sending: sending || isRecording }" @click="handleSosClick" :disabled="sending || isRecording">
          <template v-if="!sending && !isRecording">
            <el-icon :size="48"><Bell /></el-icon>
            <span class="sos-text">SOS</span>
            <span class="sos-hint" v-if="deviceMode === 'app'">点击隐蔽报警</span>
            <span class="sos-hint" v-else>拍击紧急报警</span>
          </template>
          <template v-else-if="isRecording">
            <el-icon :size="42" class="spin"><FirstAidKit /></el-icon>
            <span class="sos-text" style="font-size:18px">取证上传中</span>
          </template>
          <template v-else>
            <el-icon :size="48" class="spin"><Loading /></el-icon>
            <span class="sos-text">已接通指控</span>
          </template>
        </button>
      </div>
      <p class="sos-desc">
        {{ deviceMode === 'app' ? '系统将自动采集环境画面与录音，并连同GPS坐标一并通过军工级加密通道上传至微服中心，防断网丢失。' 
        : '按下后将立刻启动柱载双向语音对讲，头顶警灯闪烁并通知就近1分钟内的巡逻保安。' }}
      </p>
    </div>

    <!-- 补充表单信息区 -->
    <el-card class="alert-form" v-if="deviceMode === 'app'">
      <template #header><span class="section-title">人工干预详细信息（选填）</span></template>
      <el-form :model="form" label-width="90px">
        <el-form-item label="求助类型">
          <el-radio-group v-model="form.alertType">
            <el-radio-button value="SOS">治安求助</el-radio-button>
            <el-radio-button value="FIRE_ALARM">火警探测</el-radio-button>
            <el-radio-button value="MEDICAL">医疗急救</el-radio-button>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="补充定位">
          <el-input v-model="form.locationDesc" placeholder="如：图书馆3楼男厕左侧" />
        </el-form-item>
        <el-form-item label="情况描述">
          <el-input v-model="form.content" type="textarea" :rows="2" placeholder="" />
        </el-form-item>
      </el-form>
    </el-card>

    <div v-else style="text-align:center;color:#a0aec0;font-size:14px;padding:30px;">
      实体报警柱为一键物理互联，支持全双工音视频对讲，无需屏幕表单填写。
      <br>(本处可由管理人员或巡视人员触发消防/医疗特种一键告警模拟)
      <div style="margin-top:20px;display:flex;justify-content:center;gap:20px;">
        <el-button type="danger" plain @click="simPillar('FIRE_ALARM')">模拟拍击：火灾</el-button>
        <el-button type="warning" plain @click="simPillar('MEDICAL')">模拟拍击：医疗</el-button>
      </div>
    </div>

    <!-- 历史记录 -->
    <el-card class="my-alerts">
      <template #header><span class="section-title">近期待响应求助流</span></template>
      <el-table :data="myAlerts" stripe style="width: 100%">
        <el-table-column prop="alertType" label="事件定性" width="120">
          <template #default="{ row }">{{ alertTypeMap[row.alertType] || row.alertType }}</template>
        </el-table-column>
        <el-table-column prop="content" label="案卷内容" show-overflow-tooltip />
        <el-table-column prop="status" label="接处状态" width="120">
          <template #default="{ row }">
            <el-tag :type="statusTag(row.status)" size="small">{{ statusMap[row.status] }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="createdAt" label="上报时间" width="180" />
      </el-table>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { alertApi } from '../api'

const deviceMode = ref('app')
const sending = ref(false)
const isRecording = ref(false)
const myAlerts = ref<any[]>([])

// 模拟校园中心定位
const userLng = ref(110.3308)
const userLat = ref(20.0588)
const locating = ref(false)
const locationObtained = ref(false)

const form = reactive({
  alertType: 'SOS',
  locationDesc: '',
  content: ''
})

const alertTypeMap: Record<string, string> = { SOS: '治安求助', FIRE_ALARM: '火灾警报', MEDICAL: '医疗急救', SECURITY: '安保求助' }
const statusMap: Record<string, string> = { PENDING: '待处置(响铃中)', DISPATCHED: '安保已出动', IN_PROGRESS: '现场处理中', RESOLVED: '事件平息', CANCELLED: '解除防卫' }

function statusTag(s: string) {
  const m: Record<string, any> = { PENDING: 'danger', DISPATCHED: 'warning', IN_PROGRESS: '', RESOLVED: 'success', CANCELLED: 'info' }
  return m[s] || 'info'
}

function detectLocation() {
  if (!navigator.geolocation) return
  locating.value = true
  navigator.geolocation.getCurrentPosition(
    (pos) => {
      userLng.value = Number(pos.coords.longitude.toFixed(6))
      userLat.value = Number(pos.coords.latitude.toFixed(6))
      locationObtained.value = true
      locating.value = false
    },
    () => { locating.value = false },
    { enableHighAccuracy: true, timeout: 5000 }
  )
}

// 模拟触发实体报警柱特定类型
function simPillar(type: string) {
  deviceMode.value = 'pillar'
  form.alertType = type
  handleSosClick()
}

// “防断线隐蔽报警” 商业逻辑动画
async function handleSosClick() {
  if (deviceMode.value === 'app') {
    isRecording.value = true
    // 模拟 3 秒的音视频现场取证采集
    await new Promise(resolve => setTimeout(resolve, 3000))
    isRecording.value = false
  }
  
  await executeSendSos()
}

async function executeSendSos() {
  sending.value = true
  try {
    const lng = deviceMode.value === 'pillar' ? 110.3325 : userLng.value
    const lat = deviceMode.value === 'pillar' ? 20.0570 : userLat.value
    const locDesc = deviceMode.value === 'pillar' ? '一键报警柱: 第二食堂南门 (XY-110-0032)' : form.locationDesc
    const content = deviceMode.value === 'pillar' ? '实体柱触发，请求就近安保支援！' : (form.content || '学生通过APP发起求助，含 3s 音视频取证附件')

    const res: any = await alertApi.sendSos({
      alertType: form.alertType,
      lng, lat,
      locationDesc: locDesc,
      content: content
    })
    
    if (res.code === 200) {
      if(form.alertType === 'FIRE_ALARM') {
        ElMessage.error({ message: '【特大火警】已成功上报！3D态势大屏防线已被击穿，消防系统全图联动已激活！', duration: 6000 })
      } else {
        ElMessage.success('SOS 信号已加密送达安保作战指挥室！')
      }
      form.locationDesc = ''
      form.content = ''
      loadAlerts()
    }
  } catch {
    ElMessage.warning('求助信息发送异常，请拨打内线 119/110')
  } finally {
    sending.value = false
  }
}

async function loadAlerts() {
  try {
    const res: any = await alertApi.getAlerts('PENDING', 0, 10)
    if (res.code === 200) myAlerts.value = res.data?.content || []
  } catch { /* ignore */ }
}

onMounted(() => {
  detectLocation()
  loadAlerts()
})
</script>

<style scoped>
.alert-page { display: flex; flex-direction: column; gap: 20px; max-width: 1000px; margin: 0 auto; }
.mode-switch { display: flex; justify-content: center; margin-bottom: 10px; }
.sos-section {
  text-align: center; padding: 40px; border-radius: 12px;
  background: var(--bg-card); border: 1px solid var(--border-color);
  position: relative; overflow: hidden; transition: all 0.5s;
}
.pillar-mode { background: #1a202c; border: 2px solid #ed8936; }
.device-label { font-size: 14px; font-weight: bold; color: #a0aec0; margin-bottom: 30px; }

/* 取证特效 */
.recording-overlay {
  position: absolute; top: 0; left: 0; width: 100%; height: 100%;
  background: rgba(0,0,0,0.85); z-index: 10; display: flex; flex-direction: column;
  justify-content: center; align-items: center; color: #fff;
}
.record-pulse {
  width: 100px; height: 100px; border-radius: 50%;
  background: rgba(229, 62, 62, 0.4); border: 2px solid #e53e3e;
  animation: pulse-ring 1s infinite; margin-bottom: 20px;
}
@keyframes pulse-ring { 0% { transform: scale(0.8); box-shadow: 0 0 0 0 rgba(229,62,62,0.7); } 100% { transform: scale(2); box-shadow: 0 0 0 20px rgba(229,62,62,0); opacity: 0; } }
.record-info { display: flex; flex-direction: column; gap: 10px; align-items: center; font-size: 16px; font-weight: bold; }
.blink-rec { color: #e53e3e; animation: rec-blink 1s steps(1) infinite; font-size: 24px; }
@keyframes rec-blink { 50% { opacity: 0; } }
.rec-progress { width: 200px; height: 6px; background: #2d3748; border-radius: 3px; overflow: hidden; margin-top: 10px; }
.rec-bar { height: 100%; background: #48bb78; animation: rec-fill 3s linear forwards; }
@keyframes rec-fill { 0% { width: 0%; } 100% { width: 100%; } }

.sos-button-wrapper { position: relative; display: inline-block; z-index: 5; }
.sos-ripple {
  position: absolute; inset: -20px; border-radius: 50%; border: 3px solid var(--accent);
  animation: ripple 2s infinite;
}
.sos-button {
  width: 220px; height: 220px; border-radius: 50%;
  background: var(--gradient-danger); border: 6px solid rgba(229, 62, 62, 0.6);
  color: white; cursor: pointer; display: flex; flex-direction: column;
  align-items: center; justify-content: center; gap: 4px; transition: all 0.3s;
  position: relative; z-index: 1; box-shadow: 0 0 50px rgba(229, 62, 62, 0.5);
}
.pillar-mode .sos-button { background: linear-gradient(135deg, #c05621, #dd6b20); border-color: rgba(237, 137, 54, 0.6); box-shadow: 0 0 50px rgba(237, 137, 54, 0.5); }
.sos-button:hover:not(:disabled) { transform: scale(1.05); box-shadow: 0 0 80px rgba(229, 62, 62, 0.7); }
.sos-button:active:not(:disabled) { transform: scale(0.95); }
.sos-button.sending { background: linear-gradient(135deg, #a0aec0, #718096); box-shadow: none; border-color: #a0aec0; }
.sos-text { font-size: 32px; font-weight: 800; letter-spacing: 4px; }
.sos-hint { font-size: 13px; opacity: 0.9; margin-top: 4px; }
.sos-desc { margin-top: 24px; color: var(--text-secondary); font-size: 15px; max-width: 600px; margin-left: auto; margin-right: auto; line-height: 1.6; }
.spin { animation: spin 1.5s linear infinite; }
@keyframes spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
.section-title { font-weight: 600; color: var(--text-primary); font-size: 18px; }
</style>
