<template>
  <div class="drill-page fade-in-up">
    <div class="page-header">
      <el-button type="primary" @click="showCreate = true"><el-icon><Plus /></el-icon> 创建演练</el-button>
      <el-select v-model="statusFilter" placeholder="按状态筛选" clearable style="width:140px">
        <el-option label="已规划" value="PLANNED" />
        <el-option label="进行中" value="IN_PROGRESS" />
        <el-option label="已完成" value="COMPLETED" />
        <el-option label="已取消" value="CANCELLED" />
      </el-select>
    </div>

    <div class="drill-grid">
      <el-card v-for="d in filteredDrills" :key="d.id" class="drill-card">
        <div class="drill-header">
          <span class="drill-scenario">{{ scenarioEmoji(d.scenarioType) }} {{ scenarioMap[d.scenarioType] }}</span>
          <el-tag :type="drillStatusTag(d.status)" size="small">{{ drillStatusMap[d.status] }}</el-tag>
        </div>
        <h3 class="drill-name">{{ d.name }}</h3>
        <p class="drill-desc">{{ d.description || '暂无描述' }}</p>
        <div class="drill-meta">
          <span>📅 {{ formatTime(d.scheduledAt) || '待定' }}</span>
          <span>👥 {{ d.participantCount || 0 }}人</span>
        </div>
        <!-- 已完成的演练显示总结 -->
        <div v-if="d.status === 'COMPLETED' && d.summary" class="drill-summary">
          <span class="summary-label">📝 评估总结：</span>
          <span>{{ d.summary }}</span>
        </div>
        <div class="drill-actions" v-if="d.status === 'PLANNED'">
          <el-button type="success" size="small" @click="startDrill(d.id)">开始演练</el-button>
          <el-button type="danger" size="small" @click="cancelDrill(d.id)">取消</el-button>
        </div>
        <div class="drill-actions" v-else-if="d.status === 'IN_PROGRESS'">
          <el-button type="warning" size="small" @click="openEvaluation(d)">完成并评估</el-button>
        </div>
        <div class="drill-actions" v-else-if="d.status === 'COMPLETED' && !d.summary">
          <el-button type="primary" size="small" @click="openEvaluation(d)">补充评估</el-button>
        </div>
      </el-card>

      <div v-if="filteredDrills.length === 0" class="empty-state">
        <el-icon :size="64" color="#4a5568"><VideoCamera /></el-icon>
        <p>暂无演练计划</p>
      </div>
    </div>

    <!-- 创建演练弹窗 -->
    <el-dialog v-model="showCreate" title="创建演练计划" width="500px">
      <el-form :model="newDrill" label-width="80px">
        <el-form-item label="演练名称"><el-input v-model="newDrill.name" /></el-form-item>
        <el-form-item label="场景类型">
          <el-select v-model="newDrill.scenarioType" style="width: 100%">
            <el-option v-for="(v, k) in scenarioMap" :key="k" :label="v" :value="k" />
          </el-select>
        </el-form-item>
        <el-form-item label="参与人数"><el-input-number v-model="newDrill.participantCount" :min="1" /></el-form-item>
        <el-form-item label="计划时间"><el-date-picker v-model="newDrill.scheduledAt" type="datetime" style="width:100%" /></el-form-item>
        <el-form-item label="描述"><el-input v-model="newDrill.description" type="textarea" :rows="3" /></el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showCreate = false">取消</el-button>
        <el-button type="primary" @click="createDrill">创建</el-button>
      </template>
    </el-dialog>

    <!-- 评估总结弹窗 -->
    <el-dialog v-model="showEval" title="演练评估总结" width="520px">
      <div v-if="evalDrill" class="eval-header">
        <p><strong>{{ evalDrill.name }}</strong>（{{ scenarioMap[evalDrill.scenarioType] }}）</p>
        <p style="color:var(--text-secondary);font-size:13px">
          参与人数：{{ evalDrill.participantCount }}人 | 时间：{{ formatTime(evalDrill.scheduledAt) }}
        </p>
      </div>
      <el-form label-width="80px" style="margin-top:16px">
        <el-form-item label="评估评分">
          <el-rate v-model="evalScore" :texts="['差', '较差', '一般', '良好', '优秀']" show-text />
        </el-form-item>
        <el-form-item label="总结报告">
          <el-input v-model="evalSummary" type="textarea" :rows="4"
                    placeholder="请填写演练总结：响应时间、疏散效率、发现问题、改进建议等" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showEval = false">取消</el-button>
        <el-button type="primary" @click="submitEvaluation">提交评估</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { drillApi } from '../api'

const drills = ref<any[]>([])
const showCreate = ref(false)
const showEval = ref(false)
const statusFilter = ref('')
const evalDrill = ref<any>(null)
const evalScore = ref(3)
const evalSummary = ref('')

const scenarioMap: Record<string, string> = {
  FIRE: '消防演练', EARTHQUAKE: '地震逃生', FLOOD: '防洪演练',
  CHEMICAL: '化学品事故', COMPREHENSIVE: '综合演练'
}
const drillStatusMap: Record<string, string> = {
  PLANNED: '已规划', IN_PROGRESS: '进行中', COMPLETED: '已完成', CANCELLED: '已取消'
}

function scenarioEmoji(t: string) {
  return { FIRE: '🔥', EARTHQUAKE: '🌍', FLOOD: '🌊', CHEMICAL: '☣️', COMPREHENSIVE: '🎯' }[t] || '📋'
}
function drillStatusTag(s: string) {
  return { PLANNED: 'info', IN_PROGRESS: 'warning', COMPLETED: 'success', CANCELLED: 'danger' }[s] || 'info'
}

function formatTime(t: string) {
  if (!t) return ''
  return t.replace('T', ' ').substring(0, 16)
}

const filteredDrills = computed(() => {
  if (!statusFilter.value) return drills.value
  return drills.value.filter(d => d.status === statusFilter.value)
})

const newDrill = reactive({
  name: '', scenarioType: 'FIRE', participantCount: 100,
  scheduledAt: '', description: '', campusId: 1
})

function openEvaluation(drill: any) {
  evalDrill.value = drill
  evalScore.value = 3
  evalSummary.value = drill.summary || ''
  showEval.value = true
}

async function submitEvaluation() {
  if (!evalSummary.value.trim()) {
    ElMessage.warning('请填写评估总结')
    return
  }
  try {
    const scoreText = ['差', '较差', '一般', '良好', '优秀'][evalScore.value - 1]
    const fullSummary = `【评分：${scoreText}（${evalScore.value}/5）】${evalSummary.value}`

    // 先完成演练（如果是进行中），再更新总结
    if (evalDrill.value.status === 'IN_PROGRESS') {
      await drillApi.updateStatus(evalDrill.value.id, 'COMPLETED')
    }
    // 更新总结
    await drillApi.updateSummary(evalDrill.value.id, fullSummary)

    ElMessage.success('评估已提交')
    showEval.value = false
    loadDrills()
  } catch {
    ElMessage.error('提交失败')
  }
}

async function createDrill() {
  try {
    const res: any = await drillApi.createDrill(newDrill)
    if (res.code === 200) {
      ElMessage.success('创建成功')
      showCreate.value = false
      newDrill.name = ''; newDrill.description = ''
      loadDrills()
    }
  } catch { ElMessage.error('创建失败') }
}

async function startDrill(id: number) {
  try { await drillApi.updateStatus(id, 'IN_PROGRESS'); ElMessage.success('演练已开始'); loadDrills() } catch {}
}
async function cancelDrill(id: number) {
  try { await drillApi.updateStatus(id, 'CANCELLED'); ElMessage.success('已取消'); loadDrills() } catch {}
}

async function loadDrills() {
  try {
    const res: any = await drillApi.getDrills(1)
    if (res.code === 200) drills.value = res.data || []
  } catch {}
}

onMounted(loadDrills)
</script>

<style scoped>
.page-header { display: flex; gap: 12px; margin-bottom: 20px; align-items: center; }
.drill-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(340px, 1fr)); gap: 20px; }
.drill-card { transition: transform 0.2s; }
.drill-card:hover { transform: translateY(-4px); }
.drill-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px; }
.drill-scenario { font-size: 14px; color: var(--text-secondary); }
.drill-name { font-size: 18px; margin-bottom: 8px; color: var(--text-primary); }
.drill-desc { font-size: 13px; color: var(--text-secondary); margin-bottom: 12px; }
.drill-meta { display: flex; gap: 16px; font-size: 13px; color: var(--text-secondary); margin-bottom: 12px; }
.drill-summary {
  font-size: 13px; color: var(--text-secondary); margin-bottom: 12px;
  padding: 10px; border-radius: 8px; background: rgba(56, 161, 105, 0.08);
  border-left: 3px solid #38a169;
}
.summary-label { font-weight: 600; color: #38a169; }
.drill-actions { display: flex; gap: 8px; }
.empty-state { grid-column: 1 / -1; text-align: center; padding: 60px; color: var(--text-secondary); }
.eval-header { padding-bottom: 12px; border-bottom: 1px solid var(--border-color); }
</style>
