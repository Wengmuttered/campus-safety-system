<template>
  <div class="page-container fade-in-up">
    <el-card class="toolbar-card">
      <div class="toolbar">
        <el-select v-model="statusFilter" placeholder="状态筛选" clearable style="width:130px" @change="loadData">
          <el-option label="草稿" value="DRAFT" /><el-option label="已发布" value="PUBLISHED" /><el-option label="已归档" value="ARCHIVED" />
        </el-select>
        <el-button type="primary" @click="openCreate"><el-icon><Plus /></el-icon>新建预案</el-button>
      </div>
    </el-card>
    <el-card>
      <el-table :data="plans" stripe>
        <el-table-column prop="id" label="ID" width="60" />
        <el-table-column prop="title" label="预案名称" min-width="200" show-overflow-tooltip />
        <el-table-column prop="type" label="类型" width="120">
          <template #default="{ row }"><el-tag size="small">{{ typeMap[row.type] || row.type }}</el-tag></template>
        </el-table-column>
        <el-table-column prop="level" label="级别" width="80">
          <template #default="{ row }"><el-tag size="small" :type="levelTag[row.level]">{{ levelMap[row.level] }}</el-tag></template>
        </el-table-column>
        <el-table-column prop="version" label="版本" width="70" align="center" />
        <el-table-column prop="status" label="状态" width="80">
          <template #default="{ row }">
            <el-tag size="small" :type="row.status === 'PUBLISHED' ? 'success' : row.status === 'DRAFT' ? 'info' : 'warning'">
              {{ row.status === 'PUBLISHED' ? '已发布' : row.status === 'DRAFT' ? '草稿' : '已归档' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="createdAt" label="创建时间" width="150">
          <template #default="{ row }">{{ formatTime(row.createdAt) }}</template>
        </el-table-column>
        <el-table-column label="操作" width="260" fixed="right">
          <template #default="{ row }">
            <el-button type="info" size="small" text @click="viewDetail(row)">查看</el-button>
            <el-button v-if="row.status === 'DRAFT'" type="success" size="small" text @click="publishPlan(row)">发布</el-button>
            <el-button v-if="row.status === 'PUBLISHED'" type="warning" size="small" text @click="archivePlan(row)">归档</el-button>
            <el-button type="primary" size="small" text @click="openEdit(row)">编辑</el-button>
            <el-button type="danger" size="small" text @click="deletePlan(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div class="pagination-wrap">
        <el-pagination background layout="total, prev, pager, next" :total="total" :page-size="pageSize" v-model:current-page="currentPage" @current-change="loadData" />
      </div>
    </el-card>
    <!-- 新建/编辑弹窗 -->
    <el-dialog v-model="showForm" :title="isEdit ? '编辑预案' : '新建预案'" width="680px" top="5vh">
      <el-form :model="form" label-width="90px">
        <el-form-item label="预案名称"><el-input v-model="form.title" /></el-form-item>
        <el-row :gutter="16">
          <el-col :span="12">
            <el-form-item label="预案类型">
              <el-select v-model="form.type" style="width:100%"><el-option v-for="(v,k) in typeMap" :key="k" :label="v" :value="k" /></el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="预案级别">
              <el-select v-model="form.level" style="width:100%"><el-option v-for="(v,k) in levelMap" :key="k" :label="v" :value="k" /></el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="预案内容"><el-input v-model="form.content" type="textarea" :rows="8" placeholder="预案详细内容..." /></el-form-item>
        <el-form-item label="处置流程"><el-input v-model="form.procedures" type="textarea" :rows="4" placeholder="JSON格式处置步骤" /></el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showForm = false">取消</el-button>
        <el-button type="primary" @click="handleSubmit">{{ isEdit ? '保存' : '创建' }}</el-button>
      </template>
    </el-dialog>
    <!-- 预案详情弹窗 -->
    <el-dialog v-model="showDetail" title="预案详情" width="720px" top="5vh">
      <div v-if="detail" class="plan-detail">
        <h3>{{ detail.title }}</h3>
        <div class="detail-meta">
          <el-tag>{{ typeMap[detail.type] }}</el-tag>
          <el-tag :type="levelTag[detail.level]">{{ levelMap[detail.level] }}</el-tag>
          <span>版本 {{ detail.version }}</span>
        </div>
        <el-divider />
        <div class="detail-content" style="white-space:pre-wrap;line-height:1.8">{{ detail.content || '暂无详细内容' }}</div>
        <template v-if="detail.procedures">
          <el-divider content-position="left">处置流程</el-divider>
          <div style="white-space:pre-wrap;color:var(--text-secondary)">{{ detail.procedures }}</div>
        </template>
      </div>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { planApi } from '../api'

const plans = ref<any[]>([])
const total = ref(0)
const currentPage = ref(1)
const pageSize = 20
const statusFilter = ref('')
const showForm = ref(false)
const showDetail = ref(false)
const isEdit = ref(false)
const editId = ref(0)
const detail = ref<any>(null)

const form = ref({ title: '', type: 'FIRE', level: 'SCHOOL', content: '', procedures: '', campusId: 1 })

const typeMap: Record<string, string> = {
  FIRE: '火灾应急', EARTHQUAKE: '地震应急', FLOOD: '防洪应急', CHEMICAL: '化学品事故',
  PUBLIC_HEALTH: '公共卫生', VIOLENCE: '暴力事件', CROWD: '群体事件', COMPREHENSIVE: '综合应急'
}
const levelMap: Record<string, string> = { SCHOOL: '校级', COLLEGE: '院级', DEPARTMENT: '部门级' }
const levelTag: Record<string, string> = { SCHOOL: 'danger', COLLEGE: 'warning', DEPARTMENT: 'info' }

function formatTime(t: string) { return t ? t.replace('T', ' ').substring(0, 16) : '' }

async function loadData() {
  try {
    const r: any = await planApi.getPlans(1, currentPage.value - 1, pageSize, statusFilter.value || undefined)
    if (r.code === 200) { plans.value = r.data?.content || []; total.value = r.data?.totalElements || 0 }
  } catch { plans.value = [] }
}

function openCreate() { isEdit.value = false; form.value = { title: '', type: 'FIRE', level: 'SCHOOL', content: '', procedures: '', campusId: 1 }; showForm.value = true }
function openEdit(row: any) { isEdit.value = true; editId.value = row.id; form.value = { ...row }; showForm.value = true }

async function handleSubmit() {
  try {
    if (isEdit.value) { await planApi.update(editId.value, form.value) }
    else { await planApi.create(form.value) }
    ElMessage.success(isEdit.value ? '保存成功' : '创建成功'); showForm.value = false; loadData()
  } catch { /**/ }
}

async function viewDetail(row: any) {
  try { const r: any = await planApi.getPlan(row.id); detail.value = r.code === 200 ? r.data : row } catch { detail.value = row }
  showDetail.value = true
}

async function publishPlan(row: any) { await planApi.publish(row.id); ElMessage.success('预案已发布'); loadData() }
async function archivePlan(row: any) { await planApi.archive(row.id); ElMessage.success('预案已归档'); loadData() }

async function deletePlan(row: any) {
  await ElMessageBox.confirm('确认删除？', '提示', { type: 'warning' })
  await planApi.delete(row.id); ElMessage.success('已删除'); loadData()
}

onMounted(() => loadData())
</script>

<style scoped>
.page-container { max-width: 1400px; }
.toolbar-card { margin-bottom: 16px; }
.toolbar { display: flex; justify-content: space-between; align-items: center; }
.pagination-wrap { margin-top: 16px; display: flex; justify-content: flex-end; }
.plan-detail h3 { margin: 0 0 12px; color: var(--text-primary); }
.detail-meta { display: flex; align-items: center; gap: 10px; color: var(--text-secondary); font-size: 13px; }
.detail-content { color: var(--text-primary); font-size: 14px; }
</style>
