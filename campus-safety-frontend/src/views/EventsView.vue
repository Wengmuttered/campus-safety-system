<template>
  <div class="events-page fade-in-up">
    <div class="page-header">
      <el-button type="primary" @click="showCreateDialog = true">
        <el-icon><Plus /></el-icon> 上报事件
      </el-button>
      <el-select v-model="statusFilter" placeholder="按状态筛选" clearable style="width: 160px"
                 @change="handleFilterChange">
        <el-option label="已上报" value="REPORTED" />
        <el-option label="已确认" value="CONFIRMED" />
        <el-option label="处理中" value="IN_PROGRESS" />
        <el-option label="已解决" value="RESOLVED" />
        <el-option label="已关闭" value="CLOSED" />
      </el-select>
      <el-select v-model="typeFilter" placeholder="按类型筛选" clearable style="width: 160px"
                 @change="handleFilterChange">
        <el-option v-for="(v, k) in typeMap" :key="k" :label="v" :value="k" />
      </el-select>
    </div>

    <el-card>
      <el-table :data="filteredEvents" stripe>
        <el-table-column prop="title" label="事件标题" min-width="160" show-overflow-tooltip />
        <el-table-column prop="type" label="类型" width="120">
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
        <el-table-column prop="occurredAt" label="发生时间" width="180">
          <template #default="{ row }">{{ formatTime(row.occurredAt) }}</template>
        </el-table-column>
        <el-table-column label="操作" width="160" fixed="right">
          <template #default="{ row }">
            <el-button link type="primary" size="small" @click="showDetail(row)">详情</el-button>
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

      <!-- 分页 -->
      <div class="pagination-wrapper">
        <el-pagination
          v-model:current-page="currentPage"
          v-model:page-size="pageSize"
          :page-sizes="[10, 20, 50]"
          :total="totalEvents"
          layout="total, sizes, prev, pager, next, jumper"
          @size-change="loadEvents"
          @current-change="loadEvents"
        />
      </div>
    </el-card>

    <!-- 事件详情弹窗 -->
    <el-dialog v-model="showDetailDialog" title="事件详情" width="560px">
      <el-descriptions v-if="detailEvent" :column="2" border>
        <el-descriptions-item label="事件标题" :span="2">{{ detailEvent.title }}</el-descriptions-item>
        <el-descriptions-item label="事件类型">{{ typeMap[detailEvent.type] || detailEvent.type }}</el-descriptions-item>
        <el-descriptions-item label="严重程度">
          <el-tag :type="severityTag(detailEvent.severity)" size="small">{{ severityMap[detailEvent.severity] }}</el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="当前状态">
          <el-tag :type="statusTag(detailEvent.status)" size="small">{{ statusMap[detailEvent.status] }}</el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="位置描述">{{ detailEvent.locationDesc || '未填写' }}</el-descriptions-item>
        <el-descriptions-item label="发生时间" :span="2">{{ formatTime(detailEvent.occurredAt) }}</el-descriptions-item>
        <el-descriptions-item label="详细描述" :span="2">{{ detailEvent.description || '无' }}</el-descriptions-item>
        <el-descriptions-item label="坐标" :span="2">
          <span v-if="detailEvent.lng">{{ detailEvent.lng.toFixed(4) }}, {{ detailEvent.lat.toFixed(4) }}</span>
          <span v-else>未标注</span>
        </el-descriptions-item>
      </el-descriptions>
    </el-dialog>

    <!-- 创建事件弹窗 -->
    <el-dialog v-model="showCreateDialog" title="上报安全事件" width="600px">
      <el-form :model="newEvent" label-width="80px" :rules="createRules" ref="createFormRef">
        <el-form-item label="事件标题" prop="title">
          <el-input v-model="newEvent.title" placeholder="请简要描述事件" />
        </el-form-item>
        <el-form-item label="事件类型" prop="type">
          <el-select v-model="newEvent.type" style="width: 100%">
            <el-option v-for="(v, k) in typeMap" :key="k" :label="v" :value="k" />
          </el-select>
        </el-form-item>
        <el-form-item label="严重程度" prop="severity">
          <el-radio-group v-model="newEvent.severity">
            <el-radio-button value="LOW">低</el-radio-button>
            <el-radio-button value="MEDIUM">中</el-radio-button>
            <el-radio-button value="HIGH">高</el-radio-button>
            <el-radio-button value="CRITICAL">紧急</el-radio-button>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="事件位置" prop="locationDesc">
          <el-input v-model="newEvent.locationDesc" placeholder="如：理工楼3楼走廊" />
        </el-form-item>
        <el-form-item label="快捷选点">
          <el-select v-model="selectedLocation" placeholder="选择已知地点自动填充坐标" clearable
                     style="width: 100%" @change="onLocationSelect">
            <el-option v-for="loc in knownLocations" :key="loc.name" :label="loc.name"
                       :value="loc.name" />
          </el-select>
        </el-form-item>
        <el-form-item label="坐标">
          <div class="coord-row">
            <el-input-number v-model="newEvent.lng" :precision="4" :step="0.0001" controls-position="right"
                             placeholder="经度" style="width: 48%" />
            <el-input-number v-model="newEvent.lat" :precision="4" :step="0.0001" controls-position="right"
                             placeholder="纬度" style="width: 48%" />
          </div>
          <el-button link type="primary" size="small" @click="useCurrentLocation" style="margin-top: 4px">
            📍 使用我的当前位置
          </el-button>
        </el-form-item>
        <el-form-item label="详细描述">
          <el-input v-model="newEvent.description" type="textarea" :rows="3"
                    placeholder="请详细描述事件情况..." />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showCreateDialog = false">取消</el-button>
        <el-button type="primary" @click="createEvent" :loading="creating">提交</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, onMounted } from 'vue'
import { ElMessage, type FormInstance } from 'element-plus'
import { eventApi } from '../api'

const events = ref<any[]>([])
const showCreateDialog = ref(false)
const showDetailDialog = ref(false)
const detailEvent = ref<any>(null)
const statusFilter = ref('')
const typeFilter = ref('')
const currentPage = ref(1)
const pageSize = ref(20)
const totalEvents = ref(0)
const creating = ref(false)
const createFormRef = ref<FormInstance>()
const selectedLocation = ref('')

const typeMap: Record<string, string> = {
  FIRE: '火灾', EARTHQUAKE: '地震', FLOOD: '洪水', TYPHOON: '台风',
  CHEMICAL_LEAK: '化学品泄漏', POWER_OUTAGE: '停电', VIOLENCE: '暴力事件',
  MEDICAL: '医疗急救', TRAFFIC: '交通事故', OTHER: '其他'
}

const severityMap: Record<string, string> = { LOW: '低', MEDIUM: '中', HIGH: '高', CRITICAL: '紧急' }
const statusMap: Record<string, string> = { REPORTED: '已上报', CONFIRMED: '已确认', IN_PROGRESS: '处理中', RESOLVED: '已解决', CLOSED: '已关闭' }

// 已知地点列表（与后端 DataInitializer 保持一致）
const knownLocations = [
  { name: '理工楼', lng: 110.3310, lat: 20.0590 },
  { name: '图书馆', lng: 110.3295, lat: 20.0585 },
  { name: '学生食堂', lng: 110.3320, lat: 20.0575 },
  { name: '体育馆', lng: 110.3280, lat: 20.0600 },
  { name: '学生宿舍1栋', lng: 110.3335, lat: 20.0570 },
  { name: '行政楼', lng: 110.3300, lat: 20.0595 },
  { name: '化学实验楼', lng: 110.3315, lat: 20.0592 },
  { name: '东门', lng: 110.3340, lat: 20.0588 },
  { name: '操场', lng: 110.3282, lat: 20.0602 },
  { name: '学生宿舍2栋', lng: 110.3338, lat: 20.0565 }
]

const createRules = {
  title: [{ required: true, message: '请输入事件标题', trigger: 'blur' }],
  type: [{ required: true, message: '请选择事件类型', trigger: 'change' }],
  severity: [{ required: true, message: '请选择严重程度', trigger: 'change' }]
}

// 前端二次筛选（类型筛选在前端做，状态筛选在后端做）
const filteredEvents = computed(() => {
  if (!typeFilter.value) return events.value
  return events.value.filter(e => e.type === typeFilter.value)
})

function severityTag(s: string) {
  const m: Record<string, any> = { LOW: 'info', MEDIUM: '', HIGH: 'warning', CRITICAL: 'danger' }
  return m[s] || 'info'
}

function statusTag(s: string) {
  const m: Record<string, any> = { REPORTED: 'info', CONFIRMED: '', IN_PROGRESS: 'warning', RESOLVED: 'success', CLOSED: 'info' }
  return m[s] || 'info'
}

function formatTime(time: string) {
  if (!time) return '-'
  return time.replace('T', ' ').substring(0, 19)
}

const newEvent = reactive({
  title: '', type: 'FIRE', severity: 'MEDIUM', locationDesc: '', description: '', campusId: 1,
  lng: 110.3308, lat: 20.0588
})

function onLocationSelect(name: string) {
  const loc = knownLocations.find(l => l.name === name)
  if (loc) {
    newEvent.lng = loc.lng
    newEvent.lat = loc.lat
    newEvent.locationDesc = loc.name
  }
}

function useCurrentLocation() {
  if (!navigator.geolocation) {
    ElMessage.warning('浏览器不支持定位功能')
    return
  }
  navigator.geolocation.getCurrentPosition(
    (pos) => {
      newEvent.lng = Number(pos.coords.longitude.toFixed(4))
      newEvent.lat = Number(pos.coords.latitude.toFixed(4))
      ElMessage.success('已获取当前位置')
    },
    () => {
      ElMessage.warning('获取位置失败，请手动选择')
    }
  )
}

function showDetail(row: any) {
  detailEvent.value = row
  showDetailDialog.value = true
}

async function createEvent() {
  const valid = await createFormRef.value?.validate().catch(() => false)
  if (!valid) return

  creating.value = true
  try {
    const res: any = await eventApi.createEvent({
      ...newEvent,
      lng: newEvent.lng,
      lat: newEvent.lat
    })
    if (res.code === 200) {
      ElMessage.success('事件已上报')
      showCreateDialog.value = false
      // 重置表单
      newEvent.title = ''
      newEvent.description = ''
      newEvent.locationDesc = ''
      newEvent.type = 'FIRE'
      newEvent.severity = 'MEDIUM'
      selectedLocation.value = ''
      loadEvents()
    }
  } catch { ElMessage.error('上报失败') }
  finally { creating.value = false }
}

async function updateStatus(id: number, status: string) {
  try {
    const res: any = await eventApi.updateStatus(id, status)
    if (res.code === 200) { ElMessage.success('状态已更新'); loadEvents() }
  } catch { ElMessage.error('更新失败') }
}

function handleFilterChange() {
  currentPage.value = 1
  loadEvents()
}

async function loadEvents() {
  try {
    const res: any = await eventApi.getEvents(
      1,
      currentPage.value - 1,
      pageSize.value,
      statusFilter.value || undefined
    )
    if (res.code === 200) {
      events.value = res.data?.content || []
      totalEvents.value = res.data?.totalElements || 0
    }
  } catch { /* ignore */ }
}

onMounted(loadEvents)
</script>

<style scoped>
.page-header { display: flex; gap: 12px; margin-bottom: 20px; align-items: center; }
.events-page { display: flex; flex-direction: column; gap: 16px; }

.pagination-wrapper {
  display: flex;
  justify-content: flex-end;
  margin-top: 20px;
  padding-top: 16px;
  border-top: 1px solid var(--border-color);
}

.coord-row {
  display: flex;
  gap: 8px;
  width: 100%;
}
</style>
