<template>
  <div class="page-container fade-in-up">
    <el-card class="toolbar-card">
      <div class="toolbar">
        <el-select v-model="statusFilter" placeholder="状态" clearable style="width:120px" @change="loadData">
          <el-option label="草稿" value="DRAFT" /><el-option label="已发布" value="PUBLISHED" />
        </el-select>
        <el-button type="primary" @click="openCreate"><el-icon><Plus /></el-icon>发布通知</el-button>
      </div>
    </el-card>
    <el-card>
      <el-table :data="notices" stripe>
        <el-table-column prop="id" label="ID" width="60" />
        <el-table-column prop="title" label="标题" min-width="200" show-overflow-tooltip>
          <template #default="{ row }">
            <span v-if="row.isTop" style="color:#ed8936">📌 </span>{{ row.title }}
          </template>
        </el-table-column>
        <el-table-column prop="type" label="类型" width="90">
          <template #default="{ row }"><el-tag size="small">{{ typeMap[row.type] }}</el-tag></template>
        </el-table-column>
        <el-table-column prop="priority" label="优先级" width="80">
          <template #default="{ row }"><el-tag size="small" :type="prioTag[row.priority]">{{ prioMap[row.priority] }}</el-tag></template>
        </el-table-column>
        <el-table-column prop="status" label="状态" width="70">
          <template #default="{ row }"><el-tag size="small" :type="row.status==='PUBLISHED'?'success':'info'">{{ row.status==='PUBLISHED'?'已发布':'草稿' }}</el-tag></template>
        </el-table-column>
        <el-table-column prop="createdAt" label="创建时间" width="150"><template #default="{ row }">{{ fmt(row.createdAt) }}</template></el-table-column>
        <el-table-column label="操作" width="200" fixed="right">
          <template #default="{ row }">
            <el-button v-if="row.status==='DRAFT'" type="success" size="small" text @click="publish(row)">发布</el-button>
            <el-button type="primary" size="small" text @click="openEdit(row)">编辑</el-button>
            <el-button type="danger" size="small" text @click="handleDelete(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div style="margin-top:16px;display:flex;justify-content:flex-end"><el-pagination background layout="total,prev,pager,next" :total="total" :page-size="20" v-model:current-page="currentPage" @current-change="loadData" /></div>
    </el-card>
    <el-dialog v-model="showForm" :title="isEdit?'编辑通知':'发布通知'" width="600px">
      <el-form :model="form" label-width="80px">
        <el-form-item label="标题"><el-input v-model="form.title" /></el-form-item>
        <el-row :gutter="16">
          <el-col :span="8"><el-form-item label="类型"><el-select v-model="form.type" style="width:100%"><el-option v-for="(v,k) in typeMap" :key="k" :label="v" :value="k" /></el-select></el-form-item></el-col>
          <el-col :span="8"><el-form-item label="优先级"><el-select v-model="form.priority" style="width:100%"><el-option v-for="(v,k) in prioMap" :key="k" :label="v" :value="k" /></el-select></el-form-item></el-col>
          <el-col :span="8"><el-form-item label="置顶"><el-switch v-model="form.isTop" /></el-form-item></el-col>
        </el-row>
        <el-form-item label="内容"><el-input v-model="form.content" type="textarea" :rows="8" /></el-form-item>
      </el-form>
      <template #footer><el-button @click="showForm=false">取消</el-button><el-button type="primary" @click="handleSubmit">确定</el-button></template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { noticeApi } from '../api'
const notices = ref<any[]>([]); const total = ref(0); const currentPage = ref(1)
const statusFilter = ref(''); const showForm = ref(false); const isEdit = ref(false); const editId = ref(0)
const form = ref<any>({ title:'', type:'NOTICE', priority:'NORMAL', content:'', isTop:false, campusId:1 })
const typeMap: Record<string,string> = { NOTICE:'通知', ANNOUNCEMENT:'公告', ALERT:'预警', TRAINING:'培训通知' }
const prioMap: Record<string,string> = { NORMAL:'普通', IMPORTANT:'重要', URGENT:'紧急' }
const prioTag: Record<string,string> = { NORMAL:'info', IMPORTANT:'warning', URGENT:'danger' }
function fmt(t:string) { return t?t.replace('T',' ').substring(0,16):'' }
async function loadData() { try { const r:any = await noticeApi.getNotices(1, currentPage.value-1, 20, statusFilter.value||undefined); if(r.code===200){notices.value=r.data?.content||[];total.value=r.data?.totalElements||0} } catch { notices.value=[] } }
function openCreate() { isEdit.value=false; form.value={title:'',type:'NOTICE',priority:'NORMAL',content:'',isTop:false,campusId:1}; showForm.value=true }
function openEdit(row:any) { isEdit.value=true; editId.value=row.id; form.value={...row}; showForm.value=true }
async function handleSubmit() { if(isEdit.value){await noticeApi.update(editId.value,form.value)}else{await noticeApi.create(form.value)}; ElMessage.success('成功'); showForm.value=false; loadData() }
async function publish(row:any) { await noticeApi.publish(row.id); ElMessage.success('通知已发布'); loadData() }
async function handleDelete(row:any) { await ElMessageBox.confirm('确认删除？','提示',{type:'warning'}); await noticeApi.delete(row.id); ElMessage.success('已删除'); loadData() }
onMounted(()=>loadData())
</script>

<style scoped>
.page-container { max-width: 1400px; }
.toolbar-card { margin-bottom: 16px; }
.toolbar { display: flex; justify-content: space-between; align-items: center; }
</style>
