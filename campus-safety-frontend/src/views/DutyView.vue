<template>
  <div class="page-container fade-in-up">
    <el-card class="toolbar-card">
      <div class="toolbar">
        <div style="display:flex;gap:10px;align-items:center">
          <el-date-picker v-model="dateRange" type="daterange" range-separator="至" start-placeholder="开始" end-placeholder="结束" style="width:280px" @change="loadData" />
        </div>
        <el-button type="primary" @click="openCreate"><el-icon><Plus /></el-icon>新建排班</el-button>
      </div>
    </el-card>
    <el-row :gutter="20">
      <el-col :span="16">
        <el-card>
          <template #header><span style="font-weight:600;color:var(--text-primary)">排班列表</span></template>
          <el-table :data="duties" stripe>
            <el-table-column prop="dutyDate" label="日期" width="110" />
            <el-table-column prop="userId" label="值班人员" width="100" />
            <el-table-column prop="shiftType" label="班次" width="80">
              <template #default="{ row }"><el-tag size="small" :type="shiftTag[row.shiftType]">{{ shiftMap[row.shiftType] }}</el-tag></template>
            </el-table-column>
            <el-table-column prop="area" label="值班区域" width="120" />
            <el-table-column prop="status" label="状态" width="80">
              <template #default="{ row }"><el-tag size="small" :type="dutyStatusTag[row.status]">{{ dutyStatusMap[row.status] }}</el-tag></template>
            </el-table-column>
            <el-table-column label="操作" width="180">
              <template #default="{ row }">
                <el-button v-if="row.status==='SCHEDULED'" type="success" size="small" text @click="updateStatus(row,'ON_DUTY')">签到</el-button>
                <el-button v-if="row.status==='ON_DUTY'" type="warning" size="small" text @click="updateStatus(row, 'OFF_DUTY')">签退</el-button>
                <el-button type="danger" size="small" text @click="handleDelete(row)">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card>
          <template #header><span style="font-weight:600;color:var(--text-primary)">📋 今日值班</span></template>
          <div v-if="todayDuties.length===0" style="text-align:center;padding:30px;color:#a0aec0">今日暂无排班</div>
          <div v-else class="today-list">
            <div v-for="d in todayDuties" :key="d.id" class="today-item">
              <div class="today-shift"><el-tag size="small" :type="shiftTag[d.shiftType]">{{ shiftMap[d.shiftType] }}</el-tag></div>
              <div class="today-info"><span>人员ID: {{ d.userId }}</span><span class="today-area">{{ d.area || '—' }}</span></div>
              <el-tag size="small" :type="dutyStatusTag[d.status]">{{ dutyStatusMap[d.status] }}</el-tag>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
    <el-dialog v-model="showCreate" title="新建排班" width="480px">
      <el-form :model="form" label-width="80px">
        <el-form-item label="人员ID"><el-input-number v-model="form.userId" :min="1" style="width:100%" /></el-form-item>
        <el-form-item label="值班日期"><el-date-picker v-model="form.dutyDate" type="date" style="width:100%" /></el-form-item>
        <el-form-item label="班次"><el-select v-model="form.shiftType" style="width:100%"><el-option v-for="(v,k) in shiftMap" :key="k" :label="v" :value="k" /></el-select></el-form-item>
        <el-form-item label="值班区域"><el-input v-model="form.area" /></el-form-item>
        <el-form-item label="备注"><el-input v-model="form.remark" type="textarea" :rows="2" /></el-form-item>
      </el-form>
      <template #footer><el-button @click="showCreate=false">取消</el-button><el-button type="primary" @click="handleCreate">创建</el-button></template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { dutyApi } from '../api'
const duties = ref<any[]>([]); const todayDuties = ref<any[]>([]); const showCreate = ref(false)
const dateRange = ref<any>([new Date(Date.now()-7*86400000), new Date(Date.now()+7*86400000)])
const form = ref<any>({ userId:1, dutyDate:'', shiftType:'DAY', area:'', remark:'', campusId:1 })
const shiftMap: Record<string,string> = { DAY:'白班', NIGHT:'夜班', FULL:'全天' }
const shiftTag: Record<string,string> = { DAY:'', NIGHT:'warning', FULL:'danger' }
const dutyStatusMap: Record<string,string> = { SCHEDULED:'已排班', ON_DUTY:'值班中', OFF_DUTY:'已下班', ABSENT:'缺勤' }
const dutyStatusTag: Record<string,string> = { SCHEDULED:'info', ON_DUTY:'success', OFF_DUTY:'', ABSENT:'danger' }
function fmt(d:Date){ return d.toISOString().split('T')[0] }
async function loadData() {
  const [s,e] = dateRange.value||[]
  if(!s||!e) return
  try { const r:any = await dutyApi.getDuties(1, fmt(s), fmt(e)); if(r.code===200) duties.value = r.data||[] } catch { duties.value=[] }
}
async function loadToday() { try { const r:any = await dutyApi.getToday(1); if(r.code===200) todayDuties.value = r.data||[] } catch { todayDuties.value=[] } }
function openCreate() { form.value = { userId:1, dutyDate:'', shiftType:'DAY', area:'', remark:'', campusId:1 }; showCreate.value = true }
async function handleCreate() { await dutyApi.create(form.value); ElMessage.success('排班已创建'); showCreate.value=false; loadData(); loadToday() }
async function updateStatus(row:any, status:string) { await dutyApi.updateStatus(row.id, status); ElMessage.success('状态已更新'); loadData(); loadToday() }
async function handleDelete(row:any) { await ElMessageBox.confirm('确认删除？','提示',{type:'warning'}); await dutyApi.delete(row.id); ElMessage.success('已删除'); loadData() }
onMounted(()=>{ loadData(); loadToday() })
</script>

<style scoped>
.page-container { max-width: 1400px; }
.toolbar-card { margin-bottom: 16px; }
.toolbar { display: flex; justify-content: space-between; align-items: center; }
.today-list { display: flex; flex-direction: column; gap: 10px; }
.today-item { display: flex; align-items: center; gap: 10px; padding: 10px; border-radius: 8px; background: rgba(255,255,255,0.04); }
.today-info { flex: 1; display: flex; flex-direction: column; font-size: 13px; color: var(--text-primary); }
.today-area { font-size: 12px; color: var(--text-secondary); }
</style>
