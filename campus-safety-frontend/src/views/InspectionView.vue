<template>
  <div class="page-container fade-in-up">
    <!-- 统计卡片 -->
    <div class="stat-cards">
      <div class="stat-card" v-for="item in statCards" :key="item.label"
           :style="{ background: item.gradient }">
        <div class="stat-icon">
          <el-icon :size="28"><component :is="item.icon" /></el-icon>
        </div>
        <div class="stat-info">
          <span class="stat-value">{{ item.value }}</span>
          <span class="stat-label">{{ item.label }}</span>
        </div>
      </div>
    </div>

    <!-- 工具栏 -->
    <el-card class="toolbar-card">
      <div class="toolbar">
        <div class="toolbar-left">
          <el-select v-model="statusFilter" placeholder="状态筛选" clearable style="width:140px" @change="loadData">
            <el-option label="待执行" value="PENDING" />
            <el-option label="巡检中" value="IN_PROGRESS" />
            <el-option label="已完成" value="COMPLETED" />
            <el-option label="已逾期" value="OVERDUE" />
          </el-select>
        </div>
        <div style="display:flex;gap:8px">
          <el-button type="primary" @click="showCreate = true">
            <el-icon><Plus /></el-icon>新建巡检任务
          </el-button>
          <el-button @click="doExport"><el-icon><Download /></el-icon>导出Excel</el-button>
        </div>
      </div>
    </el-card>

    <!-- 巡检任务列表 -->
    <el-card>
      <el-table :data="tasks" stripe style="width:100%">
        <el-table-column prop="id" label="ID" width="60" />
        <el-table-column prop="title" label="任务名称" min-width="160" />
        <el-table-column prop="type" label="类型" width="100">
          <template #default="{ row }">
            <el-tag size="small" :type="typeTagMap[row.type] || 'info'">{{ typeMap[row.type] || row.type }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="area" label="巡检区域" width="140" />
        <el-table-column prop="status" label="状态" width="90">
          <template #default="{ row }">
            <el-tag size="small" :type="statusTagMap[row.status]">{{ statusMap[row.status] || row.status }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="result" label="结果" width="80">
          <template #default="{ row }">
            <el-tag v-if="row.result" size="small" :type="row.result === 'NORMAL' ? 'success' : 'danger'">
              {{ row.result === 'NORMAL' ? '正常' : '异常' }}
            </el-tag>
            <span v-else style="color:#a0aec0">—</span>
          </template>
        </el-table-column>
        <el-table-column prop="issueCount" label="问题数" width="70" align="center" />
        <el-table-column prop="scheduledAt" label="计划时间" width="150">
          <template #default="{ row }">{{ formatTime(row.scheduledAt) }}</template>
        </el-table-column>
        <el-table-column label="操作" width="240" fixed="right">
          <template #default="{ row }">
            <el-button v-if="row.status === 'PENDING'" type="primary" size="small" text @click="startTask(row)">开始巡检</el-button>
            <el-button v-if="row.status === 'IN_PROGRESS'" type="success" size="small" text @click="openComplete(row)">完成巡检</el-button>
            <el-button type="info" size="small" text @click="viewRecords(row)">记录</el-button>
            <el-button type="danger" size="small" text @click="deleteTask(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div class="pagination-wrap">
        <el-pagination background layout="total, prev, pager, next" :total="total" :page-size="pageSize" v-model:current-page="currentPage" @current-change="loadData" />
      </div>
    </el-card>

    <!-- 新建任务弹窗 -->
    <el-dialog v-model="showCreate" title="新建巡检任务" width="560px">
      <el-form :model="form" label-width="90px">
        <el-form-item label="任务名称"><el-input v-model="form.title" placeholder="如：教学楼消防设施巡检" /></el-form-item>
        <el-form-item label="巡检类型">
          <el-select v-model="form.type" style="width:100%">
            <el-option v-for="(label, key) in typeMap" :key="key" :label="label" :value="key" />
          </el-select>
        </el-form-item>
        <el-form-item label="巡检区域"><el-input v-model="form.area" placeholder="如：理工楼1-3层" /></el-form-item>
        <el-form-item label="计划时间"><el-date-picker v-model="form.scheduledAt" type="datetime" style="width:100%" /></el-form-item>
        <el-form-item label="备注"><el-input v-model="form.remark" type="textarea" :rows="3" /></el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showCreate = false">取消</el-button>
        <el-button type="primary" @click="handleCreate">创建</el-button>
      </template>
    </el-dialog>

    <!-- 完成巡检弹窗 -->
    <el-dialog v-model="showComplete" title="完成巡检" width="480px">
      <el-form :model="completeForm" label-width="90px">
        <el-form-item label="巡检结果">
          <el-radio-group v-model="completeForm.result">
            <el-radio value="NORMAL">正常</el-radio>
            <el-radio value="ABNORMAL">发现异常</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="问题数"><el-input-number v-model="completeForm.issueCount" :min="0" /></el-form-item>
        <el-form-item label="备注"><el-input v-model="completeForm.remark" type="textarea" :rows="3" /></el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showComplete = false">取消</el-button>
        <el-button type="primary" @click="handleComplete">提交</el-button>
      </template>
    </el-dialog>

    <!-- 巡检记录弹窗 -->
    <el-dialog v-model="showRecords" title="巡检记录" width="640px">
      <div v-if="records.length === 0" style="text-align:center;padding:20px;color:#a0aec0">暂无巡检记录</div>
      <div v-else class="record-list">
        <div v-for="r in records" :key="r.id" class="record-item">
          <div class="record-header">
            <span class="record-check">{{ r.checkItem }}</span>
            <el-tag size="small" :type="r.result === 'PASS' ? 'success' : r.result === 'FAIL' ? 'danger' : 'info'">
              {{ r.result === 'PASS' ? '合格' : r.result === 'FAIL' ? '不合格' : '不适用' }}
            </el-tag>
          </div>
          <div v-if="r.remark" class="record-remark">{{ r.remark }}</div>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { inspectionApi } from '../api'

const tasks = ref<any[]>([])
const total = ref(0)
const currentPage = ref(1)
const pageSize = 20
const statusFilter = ref('')
const showCreate = ref(false)
const showComplete = ref(false)
const showRecords = ref(false)
const records = ref<any[]>([])
const stats = ref<any>({})
const currentTask = ref<any>(null)

const form = ref({ title: '', type: 'FIRE', area: '', scheduledAt: '', remark: '', campusId: 1 })
const completeForm = ref({ result: 'NORMAL', issueCount: 0, remark: '' })

const typeMap: Record<string, string> = {
  FIRE: '消防巡检', LABORATORY: '实验室安全', FOOD: '食品安全',
  DORMITORY: '宿舍安全', ELECTRICAL: '电气安全', BUILDING: '建筑安全', COMPREHENSIVE: '综合巡检'
}
const typeTagMap: Record<string, string> = {
  FIRE: 'danger', LABORATORY: 'warning', FOOD: 'success', DORMITORY: '', ELECTRICAL: 'warning', BUILDING: 'info', COMPREHENSIVE: ''
}
const statusMap: Record<string, string> = { PENDING: '待执行', IN_PROGRESS: '巡检中', COMPLETED: '已完成', OVERDUE: '已逾期' }
const statusTagMap: Record<string, string> = { PENDING: 'info', IN_PROGRESS: 'warning', COMPLETED: 'success', OVERDUE: 'danger' }

const statCards = computed(() => [
  { label: '待执行', value: stats.value.pending ?? 0, icon: 'Clock', gradient: 'var(--gradient-primary)' },
  { label: '巡检中', value: stats.value.inProgress ?? 0, icon: 'Loading', gradient: 'var(--gradient-warning)' },
  { label: '已完成', value: stats.value.completed ?? 0, icon: 'CircleCheck', gradient: 'var(--gradient-success)' },
  { label: '发现异常', value: stats.value.abnormal ?? 0, icon: 'WarningFilled', gradient: 'var(--gradient-danger)' }
])

function formatTime(t: string) { return t ? t.replace('T', ' ').substring(0, 16) : '—' }

async function loadData() {
  try {
    const res: any = await inspectionApi.getTasks(1, currentPage.value - 1, pageSize, statusFilter.value || undefined)
    if (res.code === 200) { tasks.value = res.data?.content || []; total.value = res.data?.totalElements || 0 }
  } catch { tasks.value = [] }
}

async function loadStats() {
  try {
    const res: any = await inspectionApi.getStats(1)
    if (res.code === 200) stats.value = res.data
  } catch { /**/ }
}

async function handleCreate() {
  try {
    const res: any = await inspectionApi.createTask(form.value)
    if (res.code === 200) { ElMessage.success('创建成功'); showCreate.value = false; loadData(); loadStats() }
  } catch { /**/ }
}

async function startTask(row: any) {
  try {
    await inspectionApi.updateStatus(row.id, 'IN_PROGRESS')
    ElMessage.success('巡检已开始'); loadData(); loadStats()
  } catch { /**/ }
}

function openComplete(row: any) {
  currentTask.value = row
  completeForm.value = { result: 'NORMAL', issueCount: 0, remark: '' }
  showComplete.value = true
}

async function handleComplete() {
  try {
    await inspectionApi.completeTask(currentTask.value.id, completeForm.value)
    ElMessage.success('巡检已完成'); showComplete.value = false; loadData(); loadStats()
  } catch { /**/ }
}

async function viewRecords(row: any) {
  try {
    const res: any = await inspectionApi.getRecords(row.id)
    records.value = res.code === 200 ? (res.data || []) : []
  } catch { records.value = [] }
  showRecords.value = true
}

async function deleteTask(row: any) {
  await ElMessageBox.confirm('确认删除该巡检任务？', '提示', { type: 'warning' })
  await inspectionApi.deleteTask(row.id)
  ElMessage.success('已删除'); loadData(); loadStats()
}

function doExport() {
  const token = localStorage.getItem('token')
  window.open(`/api/export/inspections?campusId=1&token=${token}`, '_blank')
}

onMounted(() => { loadData(); loadStats() })
</script>

<style scoped>
.page-container { max-width: 1400px; }
.stat-cards { display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; margin-bottom: 20px; }
.stat-card { padding: 20px; border-radius: var(--radius); display: flex; align-items: center; gap: 14px; box-shadow: var(--shadow); transition: transform 0.2s; }
.stat-card:hover { transform: translateY(-3px); }
.stat-icon { width: 50px; height: 50px; display: flex; align-items: center; justify-content: center; background: rgba(255,255,255,0.15); border-radius: 10px; }
.stat-value { display: block; font-size: 24px; font-weight: 700; color: #fff; }
.stat-label { font-size: 12px; color: rgba(255,255,255,0.8); }
.toolbar-card { margin-bottom: 16px; }
.toolbar { display: flex; justify-content: space-between; align-items: center; }
.pagination-wrap { margin-top: 16px; display: flex; justify-content: flex-end; }
.record-list { display: flex; flex-direction: column; gap: 10px; }
.record-item { padding: 12px; border-radius: 8px; background: rgba(255,255,255,0.04); border: 1px solid var(--border-color); }
.record-header { display: flex; justify-content: space-between; align-items: center; }
.record-check { font-weight: 600; color: var(--text-primary); }
.record-remark { margin-top: 6px; font-size: 13px; color: var(--text-secondary); }
@media (max-width: 900px) { .stat-cards { grid-template-columns: repeat(2, 1fr); } }
</style>
