<template>
  <div class="safety-point-page fade-in-up">
    <div class="page-header">
      <el-button type="primary" @click="showCreate = true">
        <el-icon><Plus /></el-icon> 新增点位
      </el-button>
      <el-select v-model="typeFilter" placeholder="按类型筛选" clearable style="width: 160px"
                 @change="loadPoints">
        <el-option v-for="t in pointTypes" :key="t.value" :label="t.icon + ' ' + t.label" :value="t.value" />
      </el-select>
      <el-select v-model="statusFilter" placeholder="按状态筛选" clearable style="width: 140px">
        <el-option label="正常" value="NORMAL" />
        <el-option label="异常" value="FAULT" />
        <el-option label="维修中" value="MAINTENANCE" />
      </el-select>
    </div>

    <el-card>
      <el-table :data="filteredPoints" stripe>
        <el-table-column prop="name" label="名称" min-width="160" show-overflow-tooltip />
        <el-table-column prop="type" label="类型" width="130">
          <template #default="{ row }">
            <span>{{ pointEmoji(row.type) }} {{ pointLabel(row.type) }}</span>
          </template>
        </el-table-column>
        <el-table-column label="位置" width="130">
          <template #default="{ row }">
            {{ row.lng?.toFixed(4) }}, {{ row.lat?.toFixed(4) }}
          </template>
        </el-table-column>
        <el-table-column prop="floor" label="楼层" width="70" />
        <el-table-column prop="status" label="状态" width="90">
          <template #default="{ row }">
            <el-tag :type="statusTagType(row.status)" size="small">{{ statusLabel(row.status) }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="180" fixed="right">
          <template #default="{ row }">
            <el-button link type="primary" size="small" @click="editPoint(row)">编辑</el-button>
            <el-dropdown trigger="click" @command="(cmd: string) => updatePointStatus(row.id, cmd)">
              <el-button link type="primary" size="small">状态</el-button>
              <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item command="NORMAL">正常</el-dropdown-item>
                  <el-dropdown-item command="FAULT">异常</el-dropdown-item>
                  <el-dropdown-item command="MAINTENANCE">维修中</el-dropdown-item>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
            <el-popconfirm title="确定删除该点位？" @confirm="deletePoint(row.id)">
              <template #reference>
                <el-button link type="danger" size="small">删除</el-button>
              </template>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <!-- 新增/编辑点位弹窗 -->
    <el-dialog v-model="showCreate" :title="editingId ? '编辑安全点位' : '新增安全点位'" width="560px">
      <el-form :model="form" label-width="80px" :rules="rules" ref="formRef">
        <el-form-item label="名称" prop="name">
          <el-input v-model="form.name" placeholder="如：理工楼1楼消防栓" />
        </el-form-item>
        <el-form-item label="类型" prop="type">
          <el-select v-model="form.type" style="width: 100%">
            <el-option v-for="t in pointTypes" :key="t.value" :label="t.icon + ' ' + t.label" :value="t.value" />
          </el-select>
        </el-form-item>
        <el-form-item label="快捷选点">
          <el-select v-model="selectedLoc" placeholder="选择已知建筑" clearable style="width:100%"
                     @change="onLocSelect">
            <el-option v-for="loc in knownLocations" :key="loc.name" :label="loc.name" :value="loc.name" />
          </el-select>
        </el-form-item>
        <el-form-item label="坐标">
          <div style="display:flex;gap:8px;width:100%">
            <el-input-number v-model="form.lng" :precision="4" :step="0.0001" controls-position="right" style="width:48%" />
            <el-input-number v-model="form.lat" :precision="4" :step="0.0001" controls-position="right" style="width:48%" />
          </div>
        </el-form-item>
        <el-form-item label="楼层">
          <el-input-number v-model="form.floor" :min="0" :max="50" />
        </el-form-item>
        <el-form-item label="描述">
          <el-input v-model="form.description" type="textarea" :rows="2" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showCreate = false; editingId = 0">取消</el-button>
        <el-button type="primary" @click="submitPoint">{{ editingId ? '保存' : '创建' }}</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, onMounted } from 'vue'
import { ElMessage, type FormInstance } from 'element-plus'
import { safetyPointApi } from '../api'

const points = ref<any[]>([])
const showCreate = ref(false)
const typeFilter = ref('')
const statusFilter = ref('')
const editingId = ref(0)
const formRef = ref<FormInstance>()
const selectedLoc = ref('')

const pointTypes = [
  { value: 'FIRE_HYDRANT', label: '消防栓', icon: '🚒' },
  { value: 'FIRE_EXTINGUISHER', label: '灭火器', icon: '🧯' },
  { value: 'AED', label: 'AED除颤仪', icon: '💓' },
  { value: 'SHELTER', label: '避难所', icon: '🏠' },
  { value: 'EXIT', label: '安全出口', icon: '🚪' },
  { value: 'CAMERA', label: '监控', icon: '📹' },
  { value: 'ALARM_BUTTON', label: '报警按钮', icon: '🔴' },
  { value: 'FIRST_AID', label: '急救箱', icon: '🩹' },
  { value: 'ASSEMBLY_POINT', label: '集合点', icon: '📍' }
]

const knownLocations = [
  { name: '理工楼', lng: 110.3310, lat: 20.0590 },
  { name: '图书馆', lng: 110.3295, lat: 20.0585 },
  { name: '学生食堂', lng: 110.3320, lat: 20.0575 },
  { name: '体育馆', lng: 110.3280, lat: 20.0600 },
  { name: '学生宿舍1栋', lng: 110.3335, lat: 20.0570 },
  { name: '行政楼', lng: 110.3300, lat: 20.0595 }
]

const rules = {
  name: [{ required: true, message: '请输入名称', trigger: 'blur' }],
  type: [{ required: true, message: '请选择类型', trigger: 'change' }]
}

const form = reactive({
  name: '', type: 'FIRE_HYDRANT', lng: 110.3308, lat: 20.0588,
  floor: 1, description: '', campusId: 1
})

const filteredPoints = computed(() => {
  let result = points.value
  if (typeFilter.value) result = result.filter(p => p.type === typeFilter.value)
  if (statusFilter.value) result = result.filter(p => p.status === statusFilter.value)
  return result
})

function pointEmoji(type: string) { return pointTypes.find(t => t.value === type)?.icon || '📌' }
function pointLabel(type: string) { return pointTypes.find(t => t.value === type)?.label || type }
function statusTagType(s: string) { return { NORMAL: 'success', FAULT: 'danger', MAINTENANCE: 'warning' }[s] || 'info' }
function statusLabel(s: string) { return { NORMAL: '正常', FAULT: '异常', MAINTENANCE: '维修中' }[s] || s }

function onLocSelect(name: string) {
  const loc = knownLocations.find(l => l.name === name)
  if (loc) { form.lng = loc.lng; form.lat = loc.lat }
}

function editPoint(row: any) {
  editingId.value = row.id
  form.name = row.name; form.type = row.type
  form.lng = row.lng; form.lat = row.lat
  form.floor = row.floor || 1; form.description = row.description || ''
  showCreate.value = true
}

async function submitPoint() {
  const valid = await formRef.value?.validate().catch(() => false)
  if (!valid) return
  try {
    if (editingId.value) {
      const res: any = await safetyPointApi.updatePoint(editingId.value, { ...form })
      if (res.code === 200) { ElMessage.success('更新成功'); showCreate.value = false; editingId.value = 0; loadPoints() }
    } else {
      const res: any = await safetyPointApi.createPoint({ ...form })
      if (res.code === 200) { ElMessage.success('创建成功'); showCreate.value = false; loadPoints() }
    }
  } catch { ElMessage.error('操作失败') }
}

async function updatePointStatus(id: number, status: string) {
  try {
    const res: any = await safetyPointApi.updateStatus(id, status)
    if (res.code === 200) { ElMessage.success('状态已更新'); loadPoints() }
  } catch { ElMessage.error('更新失败') }
}

async function deletePoint(id: number) {
  try {
    const res: any = await safetyPointApi.deletePoint(id)
    if (res.code === 200) { ElMessage.success('已删除'); loadPoints() }
  } catch { ElMessage.error('删除失败') }
}

async function loadPoints() {
  try {
    const res: any = await safetyPointApi.getPoints(1)
    if (res.code === 200) points.value = res.data || []
  } catch { /* ignore */ }
}

onMounted(loadPoints)
</script>

<style scoped>
.page-header { display: flex; gap: 12px; margin-bottom: 20px; align-items: center; }
.safety-point-page { display: flex; flex-direction: column; gap: 16px; }
</style>
