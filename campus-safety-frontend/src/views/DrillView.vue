<template>
  <div class="drill-page fade-in-up">
    <div class="page-header">
      <el-button type="primary" @click="showCreate = true"><el-icon><Plus /></el-icon> 创建演练</el-button>
    </div>

    <div class="drill-grid">
      <el-card v-for="d in drills" :key="d.id" class="drill-card">
        <div class="drill-header">
          <span class="drill-scenario">{{ scenarioEmoji(d.scenarioType) }} {{ scenarioMap[d.scenarioType] }}</span>
          <el-tag :type="drillStatusTag(d.status)" size="small">{{ drillStatusMap[d.status] }}</el-tag>
        </div>
        <h3 class="drill-name">{{ d.name }}</h3>
        <p class="drill-desc">{{ d.description || '暂无描述' }}</p>
        <div class="drill-meta">
          <span>📅 {{ d.scheduledAt || '待定' }}</span>
          <span>👥 {{ d.participantCount || 0 }}人</span>
        </div>
        <div class="drill-actions" v-if="d.status === 'PLANNED'">
          <el-button type="success" size="small" @click="startDrill(d.id)">开始演练</el-button>
          <el-button type="danger" size="small" @click="cancelDrill(d.id)">取消</el-button>
        </div>
        <div class="drill-actions" v-else-if="d.status === 'IN_PROGRESS'">
          <el-button type="warning" size="small" @click="completeDrill(d.id)">完成演练</el-button>
        </div>
      </el-card>

      <div v-if="drills.length === 0" class="empty-state">
        <el-icon :size="64" color="#4a5568"><VideoCamera /></el-icon>
        <p>暂无演练计划</p>
      </div>
    </div>

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
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { drillApi } from '../api'

const drills = ref<any[]>([])
const showCreate = ref(false)
const scenarioMap: Record<string, string> = { FIRE: '消防演练', EARTHQUAKE: '地震逃生', FLOOD: '防洪演练', CHEMICAL: '化学品事故', COMPREHENSIVE: '综合演练' }
const drillStatusMap: Record<string, string> = { PLANNED: '已规划', IN_PROGRESS: '进行中', COMPLETED: '已完成', CANCELLED: '已取消' }

function scenarioEmoji(t: string) { return { FIRE: '🔥', EARTHQUAKE: '🌍', FLOOD: '🌊', CHEMICAL: '☣️', COMPREHENSIVE: '🎯' }[t] || '📋' }
function drillStatusTag(s: string) { return { PLANNED: 'info', IN_PROGRESS: 'warning', COMPLETED: 'success', CANCELLED: 'danger' }[s] || 'info' }

const newDrill = reactive({ name: '', scenarioType: 'FIRE', participantCount: 100, scheduledAt: '', description: '', campusId: 1 })

async function createDrill() {
  try { const res: any = await drillApi.createDrill(newDrill); if (res.code === 200) { ElMessage.success('创建成功'); showCreate.value = false; loadDrills() } } catch { ElMessage.error('创建失败') }
}
async function startDrill(id: number) { try { await drillApi.updateStatus(id, 'IN_PROGRESS'); ElMessage.success('演练已开始'); loadDrills() } catch {} }
async function completeDrill(id: number) { try { await drillApi.updateStatus(id, 'COMPLETED'); ElMessage.success('演练已完成'); loadDrills() } catch {} }
async function cancelDrill(id: number) { try { await drillApi.updateStatus(id, 'CANCELLED'); ElMessage.success('已取消'); loadDrills() } catch {} }
async function loadDrills() { try { const res: any = await drillApi.getDrills(1); if (res.code === 200) drills.value = res.data || [] } catch {} }

onMounted(loadDrills)
</script>

<style scoped>
.page-header { margin-bottom: 20px; }
.drill-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(340px, 1fr)); gap: 20px; }
.drill-card { transition: transform 0.2s; }
.drill-card:hover { transform: translateY(-4px); }
.drill-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px; }
.drill-scenario { font-size: 14px; color: var(--text-secondary); }
.drill-name { font-size: 18px; margin-bottom: 8px; color: var(--text-primary); }
.drill-desc { font-size: 13px; color: var(--text-secondary); margin-bottom: 12px; }
.drill-meta { display: flex; gap: 16px; font-size: 13px; color: var(--text-secondary); margin-bottom: 16px; }
.drill-actions { display: flex; gap: 8px; }
.empty-state { grid-column: 1 / -1; text-align: center; padding: 60px; color: var(--text-secondary); }
</style>
