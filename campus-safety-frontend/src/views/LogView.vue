<template>
  <div class="page-container fade-in-up">
    <el-card class="toolbar-card">
      <div class="toolbar">
        <div style="display:flex;gap:10px">
          <el-select v-model="moduleFilter" placeholder="模块" clearable style="width:120px" @change="loadData">
            <el-option label="认证" value="认证" /><el-option label="事件" value="事件" /><el-option label="报警" value="报警" />
            <el-option label="巡检" value="巡检" /><el-option label="隐患" value="隐患" /><el-option label="物资" value="物资" />
            <el-option label="用户" value="用户" />
          </el-select>
          <el-input v-model="usernameFilter" placeholder="搜索用户名" clearable style="width:160px" @clear="loadData" @keyup.enter="loadData" />
        </div>
        <span style="font-size:13px;color:var(--text-secondary)">系统操作审计日志</span>
      </div>
    </el-card>
    <el-card>
      <el-table :data="logs" stripe>
        <el-table-column prop="id" label="ID" width="60" />
        <el-table-column prop="username" label="操作人" width="100" />
        <el-table-column prop="module" label="模块" width="80">
          <template #default="{ row }"><el-tag size="small">{{ row.module }}</el-tag></template>
        </el-table-column>
        <el-table-column prop="action" label="操作" width="100" />
        <el-table-column prop="target" label="目标" width="160" show-overflow-tooltip />
        <el-table-column prop="detail" label="详情" min-width="200" show-overflow-tooltip />
        <el-table-column prop="ip" label="IP" width="120" />
        <el-table-column prop="createdAt" label="时间" width="160">
          <template #default="{ row }">{{ fmt(row.createdAt) }}</template>
        </el-table-column>
      </el-table>
      <div style="margin-top:16px;display:flex;justify-content:flex-end">
        <el-pagination background layout="total,prev,pager,next" :total="total" :page-size="20" v-model:current-page="currentPage" @current-change="loadData" />
      </div>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { logApi } from '../api'
const logs = ref<any[]>([]); const total = ref(0); const currentPage = ref(1)
const moduleFilter = ref(''); const usernameFilter = ref('')
function fmt(t:string) { return t?t.replace('T',' ').substring(0,19):'' }
async function loadData() {
  try { const r:any = await logApi.getLogs(currentPage.value-1, 20, moduleFilter.value||undefined, usernameFilter.value||undefined)
    if(r.code===200){logs.value=r.data?.content||[];total.value=r.data?.totalElements||0}
  } catch { logs.value=[] }
}
onMounted(()=>loadData())
</script>

<style scoped>
.page-container { max-width: 1400px; }
.toolbar-card { margin-bottom: 16px; }
.toolbar { display: flex; justify-content: space-between; align-items: center; }
</style>
