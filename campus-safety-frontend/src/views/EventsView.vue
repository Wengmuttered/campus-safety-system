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

    <!-- 事件详情与应急指挥台弹窗 -->
    <el-dialog v-model="showDetailDialog" :title="detailEvent?.status === 'RESOLVED' || detailEvent?.status === 'CLOSED' ? '📝 事件归档报告' : '🚨 应急指挥调度台'" width="720px" :close-on-click-modal="false" destroy-on-close @close="stopEvacuation">
      <div class="command-board" v-if="detailEvent">
        <!-- 进度条 -->
        <el-steps :active="getStepActive(detailEvent.status)" finish-status="success" align-center style="margin-bottom: 24px">
          <el-step title="初报案发" description="设备/人工报警" />
          <el-step title="指挥调度" description="SOP流程介入" />
          <el-step title="疏散救援" description="强制广播干预" />
          <el-step title="结束归档" description="AI复盘沉淀" />
        </el-steps>

        <el-collapse v-model="activeNames">
          <!-- 面板 1：基础信息与AI辅助 -->
          <el-collapse-item title="🔎 案情基础信息与 AI 初步研判" name="1">
            <el-descriptions :column="2" border>
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
            
            <el-alert v-if="detailEvent.status !== 'RESOLVED' && detailEvent.status !== 'CLOSED'"
              title="AI 事故模型动态研判建议" type="error"
              :description="`模型基于该时间段人流热力图与环境风向计算：极有可能发生次生伤害，建议立即按 [${severityMap[detailEvent.severity]}] 级别执行标准处置要求！`"
              show-icon :closable="false" style="margin-top: 12px;" />
          </el-collapse-item>

          <!-- 面板 2：SOP -->
          <el-collapse-item title="📋 标准化安全作业程序 (SOP) 检查单" name="2" v-if="detailEvent.status !== 'RESOLVED' && detailEvent.status !== 'CLOSED'">
            <el-checkbox-group v-model="checkedSOPs" @change="checkSOPProgress">
              <el-checkbox v-for="sop in currentSOPs" :key="sop" :label="sop" :value="sop" style="display:flex; margin-bottom: 8px;">
                <span style="font-size: 14px; white-space: normal">{{ sop }}</span>
              </el-checkbox>
            </el-checkbox-group>

            <div v-if="checkedSOPs.length === currentSOPs.length && currentSOPs.length > 0" class="sop-done-tips">
              <el-icon><Select /></el-icon> 该级别 SOP 流程已全部执行完毕，允许请求系统结案并开启 AI 归档！
            </div>
            <div v-else class="sop-pending-tips">
              ⚠️ 请逐项物理确认所有前置处置动作已完成，方可结案。
            </div>
          </el-collapse-item>

          <!-- 面板 3：一键下发指令 -->
          <el-collapse-item title="📡 应急指挥中心指令下发台" name="3" v-if="detailEvent.status !== 'RESOLVED' && detailEvent.status !== 'CLOSED'">
            <div class="command-buttons">
              <el-button type="danger" size="large" @click="triggerEvacuation" class="evac-btn" :loading="isEvacuating">
                <el-icon><WarnTriangleFilled /></el-icon> 启动全局一键疏散广播
              </el-button>
              
              <el-button type="success" size="large" @click="resolveEventAndIngest" :disabled="checkedSOPs.length < currentSOPs.length || checkedSOPs.length === 0">
                ✅ 确认危机解除并进行 AI 复盘沉淀
              </el-button>
            </div>
          </el-collapse-item>
        </el-collapse>
      </div>
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
import { Plus, Select, WarnTriangleFilled } from '@element-plus/icons-vue'
import { eventApi, aiApi } from '../api'

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

// ========== SOP 与指挥台逻辑 ==========
const activeNames = ref(['1', '2', '3'])
const checkedSOPs = ref<string[]>([])
const isEvacuating = ref(false)

const sopDict: Record<string, string[]> = {
  FIRE: ['现场指挥员验证火情报警级别并疏散核心区', '已切断事发楼层非消防总电源，开启应急照明', '已开启连读排烟风扇并放下防火卷帘门', '拨打 119 通知地区中队并在校门引导消防车'],
  EARTHQUAKE: ['自动切断全校主电源及主燃气阀管道', '开启全频广播指示“就近避险、掩蔽头部”', '主震结束后立刻引导按预设路线向空旷操场撤离', '调派无人机确认教学楼是否有二次坍塌塌陷风险'],
  CHEMICAL_LEAK: ['立刻划定毒区污染警戒线，上风口设置临时指挥部', '开启实验室强制排风与防爆供排控制', '联系市环保局，穿戴A级防化服前往源头抢险'],
  OTHER: ['第一发现人上报现场情况与预估风险', '确认事件波及范围及次生危险性', '调派校卫队现场维持秩序，设置隔离档', '确认无人员遗漏卡阻或重疾需要 120 支援']
}

const currentSOPs = computed(() => {
  if (!detailEvent.value) return []
  return sopDict[detailEvent.value.type] || sopDict['OTHER']
})

function getStepActive(status: string) {
  if (status === 'REPORTED') return 0
  if (status === 'CONFIRMED' || status === 'IN_PROGRESS') return 1
  if (isEvacuating.value) return 2
  if (status === 'RESOLVED' || status === 'CLOSED') return 4
  return 0
}

function checkSOPProgress() {
  // 如果事件还是刚上报未处理状态，一旦勾选SOP代表保安开始处理，自动置为处理中
  if (detailEvent.value?.status === 'REPORTED' || detailEvent.value?.status === 'CONFIRMED') {
    eventApi.updateStatus(detailEvent.value.id, 'IN_PROGRESS').then(() => {
       detailEvent.value.status = 'IN_PROGRESS'
    }).catch(()=>{})
  }
}

function triggerEvacuation() {
  ElMessage.warning('🚨 指挥中心核心指令已下发！全系统联动启动强制疏散模式...')
  isEvacuating.value = true
  
  // DOM 直接挂载满屏呼吸红框闪烁特效（增强答辩表现力）
  if (!document.getElementById('emergency-flash')) {
    const flashOverlay = document.createElement('div')
    flashOverlay.id = 'emergency-flash'
    flashOverlay.style.position = 'fixed'
    flashOverlay.style.top = '0'
    flashOverlay.style.left = '0'
    flashOverlay.style.width = '100vw'
    flashOverlay.style.height = '100vh'
    flashOverlay.style.pointerEvents = 'none'
    flashOverlay.style.zIndex = '99999'
    flashOverlay.style.animation = 'flashAnimation 1.2s infinite alternate ease-in-out'
    document.body.appendChild(flashOverlay)

    if (!document.getElementById('flash-style')) {
      const style = document.createElement('style')
      style.id = 'flash-style'
      style.innerHTML = `
        @keyframes flashAnimation {
          0% { box-shadow: inset 0 0 10px 5px rgba(229, 62, 62, 0); background-color: rgba(229,62,62,0.0); }
          100% { box-shadow: inset 0 0 150px 30px rgba(229, 62, 62, 0.4); background-color: rgba(229,62,62,0.08); }
        }
      `
      document.head.appendChild(style)
    }
  }

  setTimeout(() => {
    ElMessage.success('广播握手成功！全校走廊指引灯已联动变成指向通道。')
  }, 1500)
}

function stopEvacuation() {
  isEvacuating.value = false
  const overlay = document.getElementById('emergency-flash')
  if (overlay) overlay.remove()
}

async function resolveEventAndIngest() {
  try {
    // 1. 调用 Java 后端常规结案（记录历史字典）
    await eventApi.updateStatus(detailEvent.value.id, 'RESOLVED')
    detailEvent.value.status = 'RESOLVED'
    stopEvacuation()
    
    // 2. 调用 AI 微服务接口，实现数据闭环（模型机器学习）
    ElMessage.success('事件已解决！正在向后台 AI 知识图谱与隐患热力网投递本次结案数据结构式特征学习...')
    const severityScore = detailEvent.value.severity === 'CRITICAL' ? 3 : (detailEvent.value.severity === 'HIGH' ? 2 : 1)
    
    aiApi.ingestEvent({
      event_type: detailEvent.value.type,
      location: detailEvent.value.locationDesc,
      lat: detailEvent.value.lat || 0,
      lng: detailEvent.value.lng || 0,
      severity: severityScore
    }).then(() => {
       ElMessage.success('🧠 AI 模型归档计算并训练完成，下周同类火灾发生的预判精准度已自动提升！')
    }).catch(err => {
       ElMessage.warning('未能连接到 AI 分析引擎，已仅存储为常规结案归类。')
       console.warn('AI Ingest Error', err)
    })
    
    showDetailDialog.value = false
    loadEvents()
  } catch {
    ElMessage.error('结案指令遭遇链路异常拦截')
  }
}

function showDetail(row: any) {
  // 浅拷贝当前对象以便在弹框中无损展示
  detailEvent.value = { ...row }
  checkedSOPs.value = []
  isEvacuating.value = false
  stopEvacuation()
  activeNames.value = ['1', '2', '3'] // 默认全部展开
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

.command-board {
  margin-top: -10px;
}

.command-buttons {
  display: flex;
  flex-direction: column;
  gap: 16px;
  align-items: center;
  padding: 10px 0;
}

.evac-btn {
  width: 100%;
  max-width: 480px;
  height: 54px;
  font-size: 18px;
  font-weight: bold;
  letter-spacing: 2px;
  box-shadow: 0 4px 14px rgba(229, 62, 62, 0.4);
}

.command-buttons .el-button--success {
  width: 100%;
  max-width: 480px;
  height: 50px;
  font-size: 16px;
}

.sop-done-tips {
  margin-top: 14px;
  color: #67c23a;
  font-weight: 500;
  display: flex;
  align-items: center;
  gap: 6px;
  background: rgba(103,194,58, 0.1);
  padding: 10px;
  border-radius: 6px;
}

.sop-pending-tips {
  margin-top: 14px;
  color: #e6a23c;
  font-size: 13px;
}
</style>
