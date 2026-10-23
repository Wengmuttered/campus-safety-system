<template>
  <div class="page-container fade-in-up">
    <!-- 统计卡片 -->
    <div class="stat-cards">
      <div class="stat-card" v-for="item in statCards" :key="item.label" :style="{ background: item.gradient }">
        <div class="stat-icon"><span style="font-size:28px">{{ item.icon }}</span></div>
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
          <el-select v-model="statusFilter" placeholder="排查台账过滤" clearable style="width:160px" @change="loadData">
            <el-option v-for="(v, k) in statusMap" :key="k" :label="v" :value="k" />
          </el-select>
        </div>
        <el-button type="primary" size="large" style="font-weight:bold" @click="openCreate">
          📷 手机移动端：扫码巡查上报
        </el-button>
      </div>
    </el-card>

    <!-- 隐患闭环执行工单表 -->
    <el-card>
      <el-table :data="hazards" stripe>
        <el-table-column prop="id" label="电子案卷号" width="100">
          <template #default="{ row }">#HZ-{{ String(row.id).padStart(4, '0') }}</template>
        </el-table-column>
        <el-table-column prop="title" label="隐患名目" min-width="180" show-overflow-tooltip />
        <el-table-column prop="type" label="归属大类" width="110">
          <template #default="{ row }"><el-tag size="small" effect="dark">{{ typeMap[row.type] || row.type }}</el-tag></template>
        </el-table-column>
        <el-table-column prop="level" label="系统定级" width="90">
          <template #default="{ row }">
            <el-tag size="small" :type="levelTagMap[row.level]">{{ levelMap[row.level] || row.level }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="status" label="闭环节点" width="100">
          <template #default="{ row }">
            <el-tag size="small" :type="statusTagMap[row.status]">{{ statusMap[row.status] || row.status }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="locationDesc" label="定位戳" width="150" show-overflow-tooltip />
        <el-table-column prop="createdAt" label="发现时刻" width="160">
          <template #default="{ row }">{{ formatTime(row.createdAt) }}</template>
        </el-table-column>
        <el-table-column label="操作台 (闭环驱动)" width="280" fixed="right">
          <template #default="{ row }">
            <el-button v-if="row.status === 'REPORTED'" type="primary" size="small" text @click="updateStatus(row, 'CONFIRMED')">✅ 立案确认</el-button>
            <el-button v-if="row.status === 'CONFIRMED'" type="warning" size="small" text @click="updateStatus(row, 'RECTIFYING')">📌 派发单据</el-button>
            <el-button v-if="row.status === 'RECTIFYING'" type="success" size="small" text @click="openRectify(row)">🔧 现场修复</el-button>
            <el-button v-if="row.status === 'RECTIFIED'" type="primary" size="small" text @click="updateStatus(row, 'VERIFIED')">📸 照片复查</el-button>
            <el-button v-if="row.status === 'VERIFIED'" size="small" text @click="updateStatus(row, 'CLOSED')">归档结案</el-button>
            <el-button type="danger" size="small" text @click="handleDelete(row)" style="margin-left: 20px;">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div class="pagination-wrap">
        <el-pagination background layout="total, prev, pager, next" :total="total" :page-size="pageSize" v-model:current-page="currentPage" @current-change="loadData" />
      </div>
    </el-card>

    <!-- 📱 手机仿真：扫码与取证上报流 -->
    <el-dialog v-model="showCreate" title="【移动作战终端】" width="450px" class="mobile-dialog">
      <div class="phone-frame">
        <div class="phone-status-bar">14:55 📶 🔋98%</div>
        <div class="phone-header">安全巡查与报修上发</div>
        <div class="phone-content">
          <!-- Step 1: 扫一扫防伪码 -->
          <div v-if="reportStep === 1" class="scanner-step fade-in-up">
            <div class="scan-area">
              <div class="scan-line"></div>
              <div class="corner tl"></div><div class="corner tr"></div>
              <div class="corner bl"></div><div class="corner br"></div>
            </div>
            <p class="scan-tip text-center">请将摄像头对准安全设备防伪二维码<br><span style="font-size:12px;opacity:0.6">(系统将自动读取物料生命周期信息)</span></p>
            <el-button type="primary" plain class="mt-4 w-100" @click="mockScanSuccess">【开发模拟】扫码解析成功</el-button>
          </div>

          <!-- Step 2: 立案登记簿 -->
          <div v-if="reportStep === 2" class="form-step fade-in-up">
            <el-alert title="✅ 已绑定台账：实验楼走廊灭火器箱 (EQ-F-019)" type="success" show-icon :closable="false" style="margin-bottom:12px;" />
            
            <div class="camera-card" @click="mockCapture">
              <img v-if="form.captureMock" src="https://images.unsplash.com/photo-1542616428-f685dcea77fe?auto=format&fit=crop&q=80&w=400&h=200" class="caught-photo"/>
              <div v-else class="cam-placeholder">
                <span style="font-size:48px">📷</span>
                <div class="mt-2" style="font-weight:bold">必须拍摄现场照片（作为立案依据）</div>
              </div>
            </div>

            <el-form :model="form" label-position="top" size="small" style="margin-top:15px;">
              <el-form-item label="隐患简述(必填)"><el-input v-model="form.title" placeholder="如：箱体破损漏水" /></el-form-item>
              <div style="display:flex; gap:10px;">
                <el-form-item label="类型判定" style="flex:1">
                  <el-select v-model="form.type"><el-option v-for="(v, k) in typeMap" :key="k" :label="v" :value="k"/></el-select>
                </el-form-item>
                <el-form-item label="危险定级" style="flex:1">
                  <el-select v-model="form.level">
                    <el-option label="一般" value="MINOR"></el-option><el-option label="较大" value="MAJOR"></el-option><el-option label="重大" value="CRITICAL"></el-option>
                  </el-select>
                </el-form-item>
              </div>
            </el-form>

            <div class="mt-4 mb-2" style="font-size:12px; color:#4299e1; text-align:center; font-weight:bold">
              🤖 提交后系统将自动微信派单至责任人：【安保一队-李主管】
            </div>
            <el-button type="danger" size="large" class="w-100" style="font-weight:bold; letter-spacing:2px" :disabled="!form.captureMock" @click="handleCreate">提交云端闭环系统</el-button>
          </div>
        </div>
      </div>
      <template #footer><span style="color:#a0aec0;font-size:12px">由于此弹出为手机仿真界面，不再使用外部确认按钮。</span></template>
    </el-dialog>

    <!-- 提交整改弹窗 -->
    <el-dialog v-model="showRectify" title="设备维修回执表" width="480px">
      <el-form label-width="90px">
        <el-form-item label="换件/修复">
          <el-input v-model="rectifyResult" type="textarea" :rows="3" placeholder="请录入实际整改措施（例如：已更换外层玻璃罩与水带）" />
        </el-form-item>
        <el-form-item label="验收凭据">
          <div style="border:1px dashed #4a5568; padding:15px; text-align:center; color:#a0aec0; border-radius:6px; cursor:pointer;" @click="ElMessage.success('已模拟上传复查照片')">
            📤<br>现场完工后回传相片验证
          </div>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showRectify = false">暂存</el-button>
        <el-button type="primary" @click="handleRectify">通报验收专员</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
// 图标使用 emoji 替代，避免 VueCesium console wrapper 与 resolveComponent 冲突
import { hazardApi } from '../api'

const hazards = ref<any[]>([])
const total = ref(0)
const currentPage = ref(1)
const pageSize = 20
const statusFilter = ref('')

const showCreate = ref(false)
const reportStep = ref(1)
const showRectify = ref(false)
const rectifyResult = ref('')
const currentItem = ref<any>(null)
const stats = ref<any>({})

const form = ref({ title: '', type: 'FIRE', level: 'MINOR', locationDesc: '', description: '', campusId: 1, captureMock: false })

const typeMap: Record<string, string> = { FIRE: '消防器材残缺', ELECTRICAL: '私拉电线/过载', BUILDING: '高空坠物/裂缝', CHEMICAL: '危化品违章', TRAFFIC: '道路盲区死角', OTHER: '其他' }
const levelMap: Record<string, string> = { MINOR: '一般', MAJOR: '较大', CRITICAL: '特级重大' }
const levelTagMap: Record<string, string> = { MINOR: 'info', MAJOR: 'warning', CRITICAL: 'danger' }
const statusMap: Record<string, string> = { REPORTED: '初报录入', CONFIRMED: '管理确权', RECTIFYING: '维修调度中', RECTIFIED: '工单完成', VERIFIED: '拍照复核验证', CLOSED: '台账归档' }
const statusTagMap: Record<string, string> = { REPORTED: 'danger', CONFIRMED: 'warning', RECTIFYING: 'info', RECTIFIED: 'success', VERIFIED: 'success', CLOSED: 'info' }

const statCards = computed(() => [
  { label: '新发待指派', value: stats.value.reported ?? 0, icon: '📢', gradient: 'var(--gradient-warning)' },
  { label: '外勤维修中', value: stats.value.rectifying ?? 0, icon: '🚐', gradient: 'var(--gradient-primary)' },
  { label: '台账已归档', value: stats.value.closed ?? 0, icon: '📁', gradient: 'var(--gradient-success)' },
  { label: '严重历史欠账', value: stats.value.critical ?? 0, icon: '📊', gradient: 'var(--gradient-danger)' }
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

function openCreate() { 
  form.value = { title: '', type: 'FIRE', level: 'MINOR', locationDesc: '', description: '', campusId: 1, captureMock: false }
  reportStep.value = 1
  showCreate.value = true 
}

function mockScanSuccess() {
  form.value.locationDesc = '实训大楼北侧消防通道门外'
  reportStep.value = 2
}

function mockCapture() {
  form.value.captureMock = true
  form.value.title = '常闭式防火门违规上锁'
  form.value.level = 'MAJOR'
  form.value.type = 'FIRE'
}

async function handleCreate() {
  try {
    const payload = { ...form.value, description: form.value.captureMock ? '[包含不可涂改的照片元数据证物]' : '' }
    const r: any = await hazardApi.create(payload)
    if (r.code === 200) { ElMessage.success('报告送达成功，案卷已流转回管理中台！'); showCreate.value = false; loadData(); loadStats() }
  } catch { /**/ }
}

async function updateStatus(row: any, status: string) {
  try {
    await hazardApi.updateStatus(row.id, status)
    ElMessage.success('节点状态更新成功。系统已短信通知下一负责人。')
    loadData(); loadStats()
  } catch { /* ignore */ }
}

function openRectify(row: any) { currentItem.value = row; rectifyResult.value = ''; showRectify.value = true }

async function handleRectify() {
  await hazardApi.submitRectification(currentItem.value.id, { result: rectifyResult.value })
  ElMessage.success('工单状态变更：进入照片复核验收队列表')
  showRectify.value = false; loadData(); loadStats()
}

async function handleDelete(row: any) {
  await ElMessageBox.confirm('是否将此电子案卷从档案库中物理抹除？', '底层操作警告', { type: 'error' })
  await hazardApi.delete(row.id)
  ElMessage.success('卷宗已销毁')
  loadData(); loadStats()
}

onMounted(() => { loadData(); loadStats() })
</script>

<style scoped>
.page-container { max-width: 1400px; }
.stat-cards { display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; margin-bottom: 20px; }
.stat-card { padding: 20px; border-radius: var(--radius); display: flex; align-items: center; gap: 14px; box-shadow: var(--shadow); transition: transform 0.2s; }
.stat-card:hover { transform: translateY(-3px); }
.stat-icon { width: 50px; height: 50px; display: flex; align-items: center; justify-content: center; background: rgba(255,255,255,0.15); border-radius: 10px; }
.stat-value { display: block; font-size: 26px; font-weight: 800; color: #fff; }
.stat-label { font-size: 13px; color: rgba(255,255,255,0.8); letter-spacing: 1px; }
.toolbar-card { margin-bottom: 16px; border-left: 4px solid #48bb78; }
.toolbar { display: flex; justify-content: space-between; align-items: center; }
.pagination-wrap { margin-top: 16px; display: flex; justify-content: flex-end; }

/* 手机模拟器外壳 */
.phone-frame {
  width: 100%; border-radius: 20px; background: #1a202c; 
  box-shadow: 0 0 30px rgba(0,0,0,0.5); overflow: hidden;
  border: 8px solid #2d3748; padding-bottom: 10px;
}
.phone-status-bar { padding: 4px 15px; font-size: 11px; font-weight: bold; background: #000; color: #fff; text-align: right; }
.phone-header { padding: 12px; text-align: center; background: #2b6cb0; color: white; font-weight: bold; }
.phone-content { padding: 15px; background: #f7fafc; min-height: 300px; }
.text-center { text-align: center; }
.mt-4 { margin-top: 16px; } .mt-2 { margin-top: 8px; }
.w-100 { width: 100%; }

/* 扫码动画 */
.scan-area {
  width: 200px; height: 200px; margin: 30px auto;
  border: 1px solid rgba(66, 153, 225, 0.3); position: relative;
  background: rgba(0,0,0,0.9);
}
.corner { position: absolute; width: 20px; height: 20px; border-color: #4299e1; border-style: solid; border-width: 0; }
.tl { top: 0; left: 0; border-top-width: 4px; border-left-width: 4px; }
.tr { top: 0; right: 0; border-top-width: 4px; border-right-width: 4px; }
.bl { bottom: 0; left: 0; border-bottom-width: 4px; border-left-width: 4px; }
.br { bottom: 0; right: 0; border-bottom-width: 4px; border-right-width: 4px; }
.scan-line {
  position: absolute; left: 0; top: 0; width: 100%; height: 2px;
  background: #4299e1; box-shadow: 0 0 10px #4299e1;
  animation: scanning 2s ease-in-out infinite alternate;
}
@keyframes scanning { 0% { top: 0; } 100% { top: 198px; } }
.scan-tip { font-weight: bold; color: #4a5568; line-height: 1.6; }

/* 拍照区域 */
.camera-card {
  width: 100%; height: 160px; border-radius: 8px; overflow: hidden;
  background: #e2e8f0; border: 2px dashed #a0aec0; cursor: pointer;
  display: flex; align-items: center; justify-content: center;
}
.cam-placeholder { text-align: center; color: #718096; }
.caught-photo { width: 100%; height: 100%; object-fit: cover; }
.fade-in-up { animation: fadeUp 0.4s forwards; }
@keyframes fadeUp { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }

@media (max-width: 900px) { .stat-cards { grid-template-columns: repeat(2, 1fr); } }
</style>
