<template>
  <div class="page-container fade-in-up">
    <h2 class="page-title">⚙️ 系统设置</h2>
    <el-row :gutter="20">
      <!-- 左侧分类 -->
      <el-col :span="6">
        <el-card>
          <template #header><b>设置分类</b></template>
          <el-menu :default-active="activeCategory" @select="onCategorySelect">
            <el-menu-item index="SYSTEM"><el-icon><Setting /></el-icon>系统参数</el-menu-item>
            <el-menu-item index="SAFETY"><el-icon><Warning /></el-icon>安全规则</el-menu-item>
            <el-menu-item index="NOTIFICATION"><el-icon><Bell /></el-icon>通知设置</el-menu-item>
            <el-menu-item index="UPLOAD"><el-icon><Upload /></el-icon>上传设置</el-menu-item>
          </el-menu>
        </el-card>
        <el-card style="margin-top:16px">
          <template #header><b>📥 数据导出</b></template>
          <div class="export-list">
            <el-button text type="primary" @click="doExport('inspections')"><el-icon><Download /></el-icon>巡检报表</el-button>
            <el-button text type="primary" @click="doExport('hazards')"><el-icon><Download /></el-icon>隐患报表</el-button>
            <el-button text type="primary" @click="doExport('supplies')"><el-icon><Download /></el-icon>物资台账</el-button>
            <el-button text type="primary" @click="doExport('logs')"><el-icon><Download /></el-icon>操作日志</el-button>
          </div>
        </el-card>
      </el-col>
      <!-- 右侧配置内容 -->
      <el-col :span="18">
        <el-card>
          <template #header>
            <div style="display:flex;justify-content:space-between;align-items:center">
              <b>{{ categoryLabel }} 设置项</b>
              <div style="display:flex;gap:8px">
                <el-button size="small" type="primary" @click="showAdd = true"><el-icon><Plus /></el-icon>新增</el-button>
                <el-button size="small" type="success" @click="handleSaveAll"><el-icon><Check /></el-icon>保存全部</el-button>
              </div>
            </div>
          </template>
          <div v-if="configs.length === 0 && !loading" class="empty-tip">
            当前分类暂无配置项，点击"新增"添加。
          </div>
          <el-form v-else label-position="top">
            <div v-for="c in configs" :key="c.id" class="config-item">
              <div class="config-header">
                <span class="config-key">{{ c.configKey }}</span>
                <span class="config-desc">{{ c.description || '' }}</span>
                <el-button type="danger" text size="small" @click="handleDelete(c)"><el-icon><Delete /></el-icon></el-button>
              </div>
              <el-input v-model="c.configValue" :placeholder="c.description || '请输入值'" />
            </div>
          </el-form>
        </el-card>
      </el-col>
    </el-row>
    <!-- 新增配置 -->
    <el-dialog v-model="showAdd" title="新增配置项" width="500px">
      <el-form :model="addForm" label-width="80px">
        <el-form-item label="键名"><el-input v-model="addForm.configKey" placeholder="如：system.name" /></el-form-item>
        <el-form-item label="值"><el-input v-model="addForm.configValue" /></el-form-item>
        <el-form-item label="描述"><el-input v-model="addForm.description" /></el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showAdd = false">取消</el-button>
        <el-button type="primary" @click="handleAdd">创建</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import api from '../api'

const activeCategory = ref('SYSTEM')
const configs = ref<any[]>([])
const loading = ref(false)
const showAdd = ref(false)
const addForm = ref({ configKey: '', configValue: '', description: '' })

const categoryLabels: Record<string, string> = { SYSTEM: '系统参数', SAFETY: '安全规则', NOTIFICATION: '通知', UPLOAD: '上传' }
const categoryLabel = computed(() => categoryLabels[activeCategory.value] || activeCategory.value)

async function loadConfigs() {
  loading.value = true
  try {
    const r: any = await api.get(`/system/configs/category/${activeCategory.value}`)
    if (r.code === 200) configs.value = r.data || []
  } catch { configs.value = [] }
  loading.value = false
}

function onCategorySelect(key: string) { activeCategory.value = key; loadConfigs() }

async function handleSaveAll() {
  const batch = configs.value.map(c => ({
    configKey: c.configKey,
    configValue: c.configValue,
    category: activeCategory.value,
    description: c.description
  }))
  await api.put('/system/configs/batch', batch)
  ElMessage.success('保存成功')
}

async function handleAdd() {
  if (!addForm.value.configKey) { ElMessage.warning('请输入键名'); return }
  await api.put('/system/configs', { ...addForm.value, category: activeCategory.value })
  ElMessage.success('已创建')
  showAdd.value = false
  addForm.value = { configKey: '', configValue: '', description: '' }
  loadConfigs()
}

async function handleDelete(c: any) {
  await ElMessageBox.confirm(`确认删除配置项 "${c.configKey}"？`, '提示', { type: 'warning' })
  await api.delete(`/system/configs/${c.id}`)
  ElMessage.success('已删除')
  loadConfigs()
}

function doExport(type: string) {
  const token = localStorage.getItem('token')
  const baseURL = (api.defaults?.baseURL || '/api').replace(/\/api$/, '')
  window.open(`${baseURL}/api/export/${type}?campusId=1&token=${token}`, '_blank')
}

onMounted(() => loadConfigs())
</script>

<style scoped>
.page-container { max-width: 1300px; }
.page-title { color: var(--text-primary); margin-bottom: 20px; font-size: 20px; }
.export-list { display: flex; flex-direction: column; gap: 6px; }
.config-item { padding: 14px 0; border-bottom: 1px solid var(--border-color); }
.config-item:last-child { border-bottom: none; }
.config-header { display: flex; align-items: center; gap: 10px; margin-bottom: 8px; }
.config-key { font-weight: 600; color: var(--text-primary); font-size: 14px; }
.config-desc { flex: 1; font-size: 12px; color: var(--text-secondary); }
.empty-tip { text-align: center; padding: 40px; color: var(--text-secondary); }
</style>
