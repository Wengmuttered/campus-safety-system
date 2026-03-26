<template>
  <div class="page-container fade-in-up">
    <!-- 统计卡片 -->
    <div class="stat-cards">
      <div class="stat-card" v-for="item in statCards" :key="item.label" :style="{ background: item.gradient }">
        <div class="stat-icon"><el-icon :size="28"><component :is="item.icon" /></el-icon></div>
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
            <el-option v-for="(v, k) in statusMap" :key="k" :label="v" :value="k" />
          </el-select>
        </div>
        <el-button type="primary" @click="openCreate"><el-icon><Plus /></el-icon>上报隐患</el-button>
      </div>
    </el-card>
    <!-- 隐患列表 -->
    <el-card>
      <el-table :data="hazards" stripe>
        <el-table-column prop="id" label="ID" width="60" />
        <el-table-column prop="title" label="隐患标题" min-width="180" show-overflow-tooltip />
        <el-table-column prop="type" label="类型" width="100">
          <template #default="{ row }"><el-tag size="small">{{ typeMap[row.type] || row.type }}</el-tag></template>
        </el-table-column>
        <el-table-column prop="level" label="级别" width="80">
          <template #default="{ row }">
            <el-tag size="small" :type="levelTagMap[row.level]">{{ levelMap[row.level] || row.level }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="status" label="状态" width="90">
          <template #default="{ row }">
            <el-tag size="small" :type="statusTagMap[row.status]">{{ statusMap[row.status] || row.status }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="locationDesc" label="位置" width="140" show-overflow-tooltip />
        <el-table-column prop="createdAt" label="上报时间" width="150">
          <template #default="{ row }">{{ formatTime(row.createdAt) }}</template>
        </el-table-column>
        <el-table-column label="操作" width="280" fixed="right">
          <template #default="{ row }">
            <el-button v-if="row.status === 'REPORTED'" type="primary" size="small" text @click="updateStatus(row, 'CONFIRMED')">确认</el-button>
            <el-button v-if="row.status === 'CONFIRMED'" type="warning" size="small" text @click="updateStatus(row, 'RECTIFYING')">下达整改</el-button>
            <el-button v-if="row.status === 'RECTIFYING'" type="success" size="small" text @click="openRectify(row)">提交整改</el-button>
            <el-button v-if="row.status === 'RECTIFIED'" type="primary" size="small" text @click="updateStatus(row, 'VERIFIED')">验收通过</el-button>
            <el-button v-if="row.status === 'VERIFIED'" size="small" text @click="updateStatus(row, 'CLOSED')">关闭</el-button>
            <el-button type="danger" size="small" text @click="handleDelete(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div class="pagination-wrap">
        <el-pagination background layout="total, prev, pager, next" :total="total" :page-size="pageSize" v-model:current-page="currentPage" @current-change="loadData" />
      </div>
    </el-card>

    <!-- 上报隐患弹窗 -->
    <el-dialog v-model="showCreate" title="上报隐患" width="580px">
      <el-form :model="form" label-width="90px">
        <el-form-item label="隐患标题"><el-input v-model="form.title" /></el-form-item>
        <el-form-item label="隐患类型">
          <el-select v-model="form.type" style="width:100%">
            <el-option v-for="(v, k) in typeMap" :key="k" :label="v" :value="k" />
          </el-select>
        </el-form-item>
        <el-form-item label="隐患级别">
          <el-radio-group v-model="form.level">
            <el-radio value="MINOR">一般</el-radio>
            <el-radio value="MAJOR">较大</el-radio>
            <el-radio value="CRITICAL">重大</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="位置描述"><el-input v-model="form.locationDesc" /></el-form-item>
        <el-form-item label="详细描述"><el-input v-model="form.description" type="textarea" :rows="4" /></el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showCreate = false">取消</el-button>
        <el-button type="primary" @click="handleCreate">提交</el-button>
      </template>
    </el-dialog>

    <!-- 提交整改弹窗 -->
    <el-dialog v-model="showRectify" title="提交整改结果" width="480px">
      <el-form label-width="90px">
        <el-form-item label="整改结果"><el-input v-model="rectifyResult" type="textarea" :rows="4" placeholder="请描述整改措施和结果" /></el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showRectify = false">取消</el-button>
        <el-button type="primary" @click="handleRectify">提交</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { hazardApi } from '../api'

const hazards = ref<any[]>([])
const total = ref(0)
const currentPage = ref(1)
const pageSize = 20
const statusFilter = ref('')
const showCreate = ref(false)
const showRectify = ref(false)
const rectifyResult = ref('')
const currentItem = ref<any>(null)
const stats = ref<any>({})

const form = ref({ title: '', type: 'FIRE', level: 'MINOR', locationDesc: '', description: '', campusId: 1 })

const typeMap: Record<string, string> = {
  FIRE: '火灾隐患', ELECTRICAL: '电气隐患', BUILDING: '建筑隐患', CHEMICAL: '化学品隐患',
  TRAFFIC: '交通隐患', FOOD: '食品安全', OTHER: '其他'
}
const levelMap: Record<string, string> = { MINOR: '一般', MAJOR: '较大', CRITICAL: '重大' }
const levelTagMap: Record<string, string> = { MINOR: 'info', MAJOR: 'warning', CRITICAL: 'danger' }
const statusMap: Record<string, string> = {
  REPORTED: '已上报', CONFIRMED: '已确认', RECTIFYING: '整改中', RECTIFIED: '已整改', VERIFIED: '已验收', CLOSED: '已关闭'
}
const statusTagMap: Record<string, string> = {
  REPORTED: 'info', CONFIRMED: 'warning', RECTIFYING: '', RECTIFIED: 'success', VERIFIED: 'success', CLOSED: 'info'
}

const statCards = computed(() => [
  { label: '待处理', value: stats.value.reported ?? 0, icon: 'Bell', gradient: 'var(--gradient-warning)' },
  { label: '整改中', value: stats.value.rectifying ?? 0, icon: 'Loading', gradient: 'var(--gradient-primary)' },
  { label: '已关闭', value: stats.value.closed ?? 0, icon: 'CircleCheck', gradient: 'var(--gradient-success)' },
  { label: '重大隐患', value: stats.value.critical ?? 0, icon: 'WarningFilled', gradient: 'var(--gradient-danger)' }
])

function formatTime(t: string) { return t ? t.replace('T', ' ').substring(0, 16) : '' }

async function loadData() {
  try {
    const res: any = await hazardApi.getHazards(1, currentPage.value - 1, pageSize, statusFilter.value || undefined)
    if (res.code === 200) { hazards.value = res.data?.content || []; total.value = res.data?.totalElements || 0 }
  } catch { hazards.value = [] }
}

async function loadStats() {
  try { const r: any = await hazardApi.getStats(1); if (r.code === 200) stats.value = r.data } catch { /**/ }
}

function openCreate() { form.value = { title: '', type: 'FIRE', level: 'MINOR', locationDesc: '', description: '', campusId: 1 }; showCreate.value = true }

async function handleCreate() {
  try {
    const r: any = await hazardApi.create(form.value)
    if (r.code === 200) { ElMessage.success('隐患已上报'); showCreate.value = false; loadData(); loadStats() }
  } catch { /**/ }
}

async function updateStatus(row: any, status: string) {
  await hazardApi.updateStatus(row.id, status)
  ElMessage.success('状态已更新'); loadData(); loadStats()
}

function openRectify(row: any) { currentItem.value = row; rectifyResult.value = ''; showRectify.value = true }

async function handleRectify() {
  await hazardApi.submitRectification(currentItem.value.id, { result: rectifyResult.value })
  ElMessage.success('整改结果已提交'); showRectify.value = false; loadData(); loadStats()
}

async function handleDelete(row: any) {
  await ElMessageBox.confirm('确认删除？', '提示', { type: 'warning' })
  await hazardApi.delete(row.id)
  ElMessage.success('已删除'); loadData(); loadStats()
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
@media (max-width: 900px) { .stat-cards { grid-template-columns: repeat(2, 1fr); } }
</style>
