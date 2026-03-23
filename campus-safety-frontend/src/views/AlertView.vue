<template>
  <div class="alert-page fade-in-up">
    <div class="sos-section">
      <div class="sos-button-wrapper">
        <div class="sos-ripple" v-if="!sending"></div>
        <button class="sos-button" :class="{ sending }" @click="sendSos" :disabled="sending">
          <template v-if="!sending">
            <el-icon :size="48"><Bell /></el-icon>
            <span class="sos-text">SOS</span>
            <span class="sos-hint">点击发送求助</span>
          </template>
          <template v-else>
            <el-icon :size="48" class="spin"><Loading /></el-icon>
            <span class="sos-text">发送中...</span>
          </template>
        </button>
      </div>
      <p class="sos-desc">紧急情况下按下SOS按钮，系统将自动向安保人员发送求助信号并推送您的位置</p>
    </div>

    <el-card class="alert-form">
      <template #header><span class="section-title">求助详情（可选）</span></template>
      <el-form :model="form" label-width="80px">
        <el-form-item label="求助类型">
          <el-radio-group v-model="form.alertType">
            <el-radio-button value="SOS">紧急求助</el-radio-button>
            <el-radio-button value="FIRE_ALARM">火警</el-radio-button>
            <el-radio-button value="MEDICAL">医疗救助</el-radio-button>
            <el-radio-button value="SECURITY">安全求助</el-radio-button>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="位置描述">
          <el-input v-model="form.locationDesc" placeholder="如：图书馆3楼走廊" />
        </el-form-item>
        <el-form-item label="详细说明">
          <el-input v-model="form.content" type="textarea" :rows="3" placeholder="请描述您的紧急情况" />
        </el-form-item>
      </el-form>
    </el-card>

    <!-- 我的报警记录 -->
    <el-card class="my-alerts">
      <template #header><span class="section-title">我的求助记录</span></template>
      <el-table :data="myAlerts" stripe style="width: 100%">
        <el-table-column prop="alertType" label="类型" width="100">
          <template #default="{ row }">{{ alertTypeMap[row.alertType] || row.alertType }}</template>
        </el-table-column>
        <el-table-column prop="content" label="内容" show-overflow-tooltip />
        <el-table-column prop="status" label="状态" width="100">
          <template #default="{ row }">
            <el-tag :type="statusTag(row.status)" size="small">{{ statusMap[row.status] }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="createdAt" label="时间" width="180" />
      </el-table>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { alertApi } from '../api'

const sending = ref(false)
const myAlerts = ref<any[]>([])

const form = reactive({
  alertType: 'SOS',
  locationDesc: '',
  content: ''
})

const alertTypeMap: Record<string, string> = {
  SOS: '紧急求助', FIRE_ALARM: '火警', MEDICAL: '医疗救助', SECURITY: '安全求助'
}

const statusMap: Record<string, string> = {
  PENDING: '待处理', DISPATCHED: '已派遣', IN_PROGRESS: '处理中', RESOLVED: '已解决', CANCELLED: '已取消'
}

function statusTag(s: string) {
  const m: Record<string, any> = { PENDING: 'danger', DISPATCHED: 'warning', IN_PROGRESS: '', RESOLVED: 'success', CANCELLED: 'info' }
  return m[s] || 'info'
}

async function sendSos() {
  sending.value = true
  try {
    const res: any = await alertApi.sendSos({
      alertType: form.alertType,
      lng: 110.3308,
      lat: 20.0588,
      locationDesc: form.locationDesc,
      content: form.content
    })
    if (res.code === 200) {
      ElMessage.success('求助信息已发送，安保人员将尽快响应！')
      form.locationDesc = ''
      form.content = ''
    }
  } catch {
    ElMessage.warning('求助信息发送失败，请拨打校园应急电话')
  } finally {
    sending.value = false
  }
}

onMounted(async () => {
  try {
    const res: any = await alertApi.getAlerts('PENDING', 0, 10)
    if (res.code === 200) myAlerts.value = res.data?.content || []
  } catch {
    // ignore
  }
})
</script>

<style scoped>
.alert-page {
  display: flex;
  flex-direction: column;
  gap: 24px;
}

.sos-section {
  text-align: center;
  padding: 40px;
}

.sos-button-wrapper {
  position: relative;
  display: inline-block;
}

.sos-ripple {
  position: absolute;
  inset: -20px;
  border-radius: 50%;
  border: 3px solid var(--accent);
  animation: ripple 2s infinite;
}

.sos-button {
  width: 200px;
  height: 200px;
  border-radius: 50%;
  background: var(--gradient-danger);
  border: 4px solid rgba(229, 62, 62, 0.5);
  color: white;
  cursor: pointer;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 4px;
  transition: all 0.3s;
  position: relative;
  z-index: 1;
  box-shadow: 0 0 40px rgba(229, 62, 62, 0.4);
}

.sos-button:hover:not(:disabled) {
  transform: scale(1.05);
  box-shadow: 0 0 60px rgba(229, 62, 62, 0.6);
}

.sos-button:active:not(:disabled) {
  transform: scale(0.95);
}

.sos-button.sending {
  background: linear-gradient(135deg, #a0aec0, #718096);
  box-shadow: none;
}

.sos-text {
  font-size: 28px;
  font-weight: 800;
  letter-spacing: 4px;
}

.sos-hint {
  font-size: 12px;
  opacity: 0.8;
}

.sos-desc {
  margin-top: 20px;
  color: var(--text-secondary);
  font-size: 14px;
}

.spin {
  animation: spin 1s linear infinite;
}

@keyframes spin {
  from { transform: rotate(0deg); }
  to { transform: rotate(360deg); }
}

.section-title {
  font-weight: 600;
  color: var(--text-primary);
}
</style>
