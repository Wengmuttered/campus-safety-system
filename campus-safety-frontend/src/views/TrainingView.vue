<template>
  <div class="page-container fade-in-up">
    <el-card class="toolbar-card">
      <div class="toolbar">
        <span style="font-size:15px;font-weight:600;color:var(--text-primary)">📚 安全培训课程</span>
        <el-button type="primary" @click="openCreate"><el-icon><Plus /></el-icon>新建课程</el-button>
      </div>
    </el-card>
    <!-- 课程卡片网格 -->
    <div class="course-grid">
      <el-card v-for="c in courses" :key="c.id" class="course-card" shadow="hover">
        <div class="course-cover" :style="{ background: coverBg(c.type) }">
          <span class="course-type-icon">{{ typeIcon[c.type]||'📖' }}</span>
          <el-tag v-if="c.mandatory" type="danger" size="small" class="mandatory-tag">必修</el-tag>
        </div>
        <div class="course-body">
          <h4>{{ c.title }}</h4>
          <div class="course-meta">
            <el-tag size="small">{{ typeMap[c.type] }}</el-tag>
            <span>{{ c.duration||0 }}分钟</span>
          </div>
          <div class="course-actions">
            <el-button v-if="c.status==='DRAFT'" type="success" size="small" @click="publishCourse(c)">发布</el-button>
            <el-button type="primary" size="small" @click="openEdit(c)">编辑</el-button>
            <el-button type="danger" size="small" text @click="handleDelete(c)">删除</el-button>
          </div>
        </div>
      </el-card>
    </div>
    <div style="margin-top:16px;display:flex;justify-content:flex-end"><el-pagination background layout="total,prev,pager,next" :total="total" :page-size="12" v-model:current-page="currentPage" @current-change="loadData" /></div>
    <el-dialog v-model="showForm" :title="isEdit?'编辑课程':'新建课程'" width="580px">
      <el-form :model="form" label-width="80px">
        <el-form-item label="课程名称"><el-input v-model="form.title" /></el-form-item>
        <el-row :gutter="16">
          <el-col :span="12"><el-form-item label="类型"><el-select v-model="form.type" style="width:100%"><el-option v-for="(v,k) in typeMap" :key="k" :label="v" :value="k" /></el-select></el-form-item></el-col>
          <el-col :span="6"><el-form-item label="时长"><el-input-number v-model="form.duration" :min="1" style="width:100%" /></el-form-item></el-col>
          <el-col :span="6"><el-form-item label="必修"><el-switch v-model="form.mandatory" /></el-form-item></el-col>
        </el-row>
        <el-form-item label="课程内容"><el-input v-model="form.content" type="textarea" :rows="6" /></el-form-item>
        <el-form-item label="视频链接"><el-input v-model="form.videoUrl" placeholder="可选" /></el-form-item>
      </el-form>
      <template #footer><el-button @click="showForm=false">取消</el-button><el-button type="primary" @click="handleSubmit">确定</el-button></template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { trainingApi } from '../api'
const courses = ref<any[]>([]); const total = ref(0); const currentPage = ref(1)
const showForm = ref(false); const isEdit = ref(false); const editId = ref(0)
const form = ref<any>({ title:'', type:'FIRE', content:'', videoUrl:'', duration:30, mandatory:false, campusId:1 })
const typeMap: Record<string,string> = { FIRE:'消防安全', FIRST_AID:'急救培训', DISASTER:'防灾减灾', LAB_SAFETY:'实验室安全', FOOD_SAFETY:'食品安全', TRAFFIC:'交通安全', REGULATION:'安全规范' }
const typeIcon: Record<string,string> = { FIRE:'🔥', FIRST_AID:'🏥', DISASTER:'🌊', LAB_SAFETY:'🔬', FOOD_SAFETY:'🍽️', TRAFFIC:'🚗', REGULATION:'📋' }
function coverBg(type:string) { const m:Record<string,string> = { FIRE:'linear-gradient(135deg,#e53e3e,#ed8936)', FIRST_AID:'linear-gradient(135deg,#38a169,#68d391)', DISASTER:'linear-gradient(135deg,#3182ce,#63b3ed)', LAB_SAFETY:'linear-gradient(135deg,#805ad5,#b794f4)', FOOD_SAFETY:'linear-gradient(135deg,#d69e2e,#f6e05e)', TRAFFIC:'linear-gradient(135deg,#2d3748,#4a5568)', REGULATION:'linear-gradient(135deg,#4299e1,#90cdf4)' }; return m[type]||m.FIRE }
async function loadData() { try { const r:any = await trainingApi.getCourses(1, currentPage.value-1, 12); if(r.code===200){courses.value=r.data?.content||[];total.value=r.data?.totalElements||0} } catch { courses.value=[] } }
function openCreate() { isEdit.value=false; form.value={title:'',type:'FIRE',content:'',videoUrl:'',duration:30,mandatory:false,campusId:1}; showForm.value=true }
function openEdit(row:any) { isEdit.value=true; editId.value=row.id; form.value={...row}; showForm.value=true }
async function handleSubmit() { if(isEdit.value){await trainingApi.updateCourse(editId.value,form.value)}else{await trainingApi.createCourse(form.value)}; ElMessage.success('成功'); showForm.value=false; loadData() }
async function publishCourse(c:any) { await trainingApi.publishCourse(c.id); ElMessage.success('课程已发布'); loadData() }
async function handleDelete(c:any) { await ElMessageBox.confirm('确认删除？','提示',{type:'warning'}); await trainingApi.deleteCourse(c.id); ElMessage.success('已删除'); loadData() }
onMounted(()=>loadData())
</script>

<style scoped>
.page-container { max-width: 1400px; }
.toolbar-card { margin-bottom: 16px; }
.toolbar { display: flex; justify-content: space-between; align-items: center; }
.course-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 20px; }
.course-card { overflow: hidden; border-radius: 12px; }
.course-card :deep(.el-card__body) { padding: 0; }
.course-cover { height: 120px; display: flex; align-items: center; justify-content: center; position: relative; }
.course-type-icon { font-size: 40px; }
.mandatory-tag { position: absolute; top: 8px; right: 8px; }
.course-body { padding: 16px; }
.course-body h4 { margin: 0 0 8px; color: var(--text-primary); font-size: 15px; }
.course-meta { display: flex; align-items: center; gap: 8px; font-size: 12px; color: var(--text-secondary); margin-bottom: 12px; }
.course-actions { display: flex; gap: 6px; }
</style>
