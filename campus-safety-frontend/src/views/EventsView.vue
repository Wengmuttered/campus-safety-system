<template>
  <div class="events-page fade-in-up">
    <div class="page-header">
      <el-button type="primary" @click="showCreateDialog = true">
        <el-icon><Plus /></el-icon> 上报事件
      </el-button>
      <el-select v-model="statusFilter" placeholder="按状态筛选" clearable style="width: 160px">
        <el-option label="已上报" value="REPORTED" />
        <el-option label="已确认" value="CONFIRMED" />
        <el-option label="处理中" value="IN_PROGRESS" />
        <el-option label="已解决" value="RESOLVED" />
        <el-option label="已关闭" value="CLOSED" />
      </el-select>
    </div>

    <el-card>
      <el-table :data="events" stripe>
        <el-table-column prop="title" label="事件标题" min-width="160" show-overflow-tooltip />
        <el-table-column prop="type" label="类型" width="100">
          <template #default="{ row }">{{ typeMap[row.type] || row.type }}</template>
        </el-table-column>
        <el-table-column prop="severity" label="严重程度" width="100">
          <template #default="{ row }">
            <el-tag :type="severityTag(row.severity)" size="small">{{ severityMap[row.severity] }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="locationDesc" label="位置" width="150" show-overflow-tooltip />
        <el-table-column prop="status" label="状态" width="100">
          <template #default="{ row }">
            <el-tag :type="statusTag(row.status)" size="small">{{ statusMap[row.status] }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="occurredAt" label="发生时间" width="180" />
        <el-table-column label="操作" width="120">
          <template #default="{ row }">
            <el-dropdown trigger="click" @command="(cmd: string) => updateStatus(row.id, cmd)">
              <el-button link type="primary" size="small">更新状态</el-button>
              <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item command="CONFIRMED">确认</el-dropdown-item>
                  <el-dropdown-item command="IN_PROGRESS">处理中</el-dropdown-item>
                  <el-dropdown-item command="RESOLVED">已解决</el-dropdown-item>
                  <el-dropdown-item command="CLOSED">关闭</el-dropdown-item>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <!-- 创建事件弹窗 -->
    <el-dialog v-model="showCreateDialog" title="上报安全事件" width="560px">
      <el-form :model="newEvent" label-width="80px">
        <el-form-item label="事件标题"><el-input v-model="newEvent.title" /></el-form-item>
        <el-form-item label="事件类型">
          <el-select v-model="newEvent.type" style="width: 100%">
            <el-option v-for="(v, k) in typeMap" :key="k" :label="v" :value="k" />
          </el-select>
        </el-form-item>
        <el-form-item label="严重程度">
          <el-radio-group v-model="newEvent.severity">
            <el-radio-button value="LOW">低</el-radio-button>
            <el-radio-button value="MEDIUM">中</el-radio-button>
            <el-radio-button value="HIGH">高</el-radio-button>
            <el-radio-button value="CRITICAL">紧急</el-radio-button>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="位置描述"><el-input v-model="newEvent.locationDesc" /></el-form-item>
        <el-form-item label="详细描述"><el-input v-model="newEvent.description" type="textarea" :rows="3" /></el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showCreateDialog = false">取消</el-button>
        <el-button type="primary" @click="createEvent">提交</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { eventApi } from '../api'

const events = ref<any[]>([])
const showCreateDialog = ref(false)
const statusFilter = ref('')

const typeMap: Record<string, string> = {
  FIRE: '火灾', EARTHQUAKE: '地震', FLOOD: '洪水', TYPHOON: '台风',
  CHEMICAL_LEAK: '化学品泄漏', POWER_OUTAGE: '停电', VIOLENCE: '暴力事件',
  MEDICAL: '医疗急救', TRAFFIC: '交通事故', OTHER: '其他'
}

const severityMap: Record<string, string> = { LOW: '低', MEDIUM: '中', HIGH: '高', CRITICAL: '紧急' }
const statusMap: Record<string, string> = { REPORTED: '已上报', CONFIRMED: '已确认', IN_PROGRESS: '处理中', RESOLVED: '已解决', CLOSED: '已关闭' }

function severityTag(s: string) {
  const m: Record<string, any> = { LOW: 'info', MEDIUM: '', HIGH: 'warning', CRITICAL: 'danger' }
  return m[s] || 'info'
}

function statusTag(s: string) {
  const m: Record<string, any> = { REPORTED: 'info', CONFIRMED: '', IN_PROGRESS: 'warning', RESOLVED: 'success', CLOSED: 'info' }
  return m[s] || 'info'
}

const newEvent = reactive({
  title: '', type: 'FIRE', severity: 'MEDIUM', locationDesc: '', description: '', campusId: 1
})

async function createEvent() {
  try {
    const res: any = await eventApi.createEvent({ ...newEvent, lng: 110.3308, lat: 20.0588 })
    if (res.code === 200) {
      ElMessage.success('事件已上报')
      showCreateDialog.value = false
      loadEvents()
    }
  } catch { ElMessage.error('上报失败') }
}

async function updateStatus(id: number, status: string) {
  try {
    const res: any = await eventApi.updateStatus(id, status)
    if (res.code === 200) { ElMessage.success('状态已更新'); loadEvents() }
  } catch { ElMessage.error('更新失败') }
}

async function loadEvents() {
  try {
    const res: any = await eventApi.getEvents(1, 0, 50)
    if (res.code === 200) events.value = res.data?.content || []
  } catch { /* ignore */ }
}

onMounted(loadEvents)
</script>

<style scoped>
.page-header { display: flex; gap: 12px; margin-bottom: 20px; }
.events-page { display: flex; flex-direction: column; gap: 16px; }
</style>
