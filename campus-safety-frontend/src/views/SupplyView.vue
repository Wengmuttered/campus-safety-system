<template>
  <div class="page-container fade-in-up">
    <el-card class="toolbar-card">
      <div class="toolbar">
        <el-select v-model="categoryFilter" placeholder="分类筛选" clearable style="width:140px" @change="loadData">
          <el-option v-for="(v, k) in categoryMap" :key="k" :label="v" :value="k" />
        </el-select>
        <div style="display:flex;gap:10px">
          <el-button @click="loadWarnings"><el-icon><WarningFilled /></el-icon>库存预警</el-button>
          <el-button type="primary" @click="openCreate"><el-icon><Plus /></el-icon>录入物资</el-button>
        </div>
      </div>
    </el-card>
    <el-card>
      <el-table :data="supplies" stripe>
        <el-table-column prop="id" label="ID" width="60" />
        <el-table-column prop="name" label="物资名称" min-width="140" />
        <el-table-column prop="category" label="分类" width="100">
          <template #default="{ row }"><el-tag size="small">{{ categoryMap[row.category] || row.category }}</el-tag></template>
        </el-table-column>
        <el-table-column prop="model" label="规格" width="100" />
        <el-table-column prop="quantity" label="库存" width="70" align="center" />
        <el-table-column prop="unit" label="单位" width="50" />
        <el-table-column prop="status" label="状态" width="80">
          <template #default="{ row }">
            <el-tag size="small" :type="statusTag[row.status]">{{ statusMap[row.status] }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="240" fixed="right">
          <template #default="{ row }">
            <el-button type="success" size="small" text @click="openRecord(row, 'IN')">入库</el-button>
            <el-button type="warning" size="small" text @click="openRecord(row, 'OUT')">出库</el-button>
            <el-button type="primary" size="small" text @click="openEdit(row)">编辑</el-button>
            <el-button type="danger" size="small" text @click="handleDelete(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div style="margin-top:16px;display:flex;justify-content:flex-end">
        <el-pagination background layout="total, prev, pager, next" :total="total" :page-size="20" v-model:current-page="currentPage" @current-change="loadData" />
      </div>
    </el-card>
    <el-dialog v-model="showForm" :title="isEdit ? '编辑物资' : '录入物资'" width="560px">
      <el-form :model="form" label-width="90px">
        <el-form-item label="物资名称"><el-input v-model="form.name" /></el-form-item>
        <el-row :gutter="16">
          <el-col :span="12"><el-form-item label="分类"><el-select v-model="form.category" style="width:100%"><el-option v-for="(v,k) in categoryMap" :key="k" :label="v" :value="k" /></el-select></el-form-item></el-col>
          <el-col :span="12"><el-form-item label="规格"><el-input v-model="form.model" /></el-form-item></el-col>
        </el-row>
        <el-row :gutter="16">
          <el-col :span="8"><el-form-item label="数量"><el-input-number v-model="form.quantity" :min="0" style="width:100%" /></el-form-item></el-col>
          <el-col :span="8"><el-form-item label="单位"><el-input v-model="form.unit" /></el-form-item></el-col>
          <el-col :span="8"><el-form-item label="预警值"><el-input-number v-model="form.minStock" :min="0" style="width:100%" /></el-form-item></el-col>
        </el-row>
        <el-form-item label="存放位置"><el-input v-model="form.warehouseLocation" /></el-form-item>
      </el-form>
      <template #footer><el-button @click="showForm=false">取消</el-button><el-button type="primary" @click="handleSubmit">确定</el-button></template>
    </el-dialog>
    <el-dialog v-model="showRecord" :title="recordType==='IN'?'入库':'出库'" width="400px">
      <el-form label-width="70px">
        <el-form-item label="数量"><el-input-number v-model="recordQty" :min="1" style="width:100%" /></el-form-item>
        <el-form-item label="原因"><el-input v-model="recordReason" /></el-form-item>
      </el-form>
      <template #footer><el-button @click="showRecord=false">取消</el-button><el-button type="primary" @click="handleRecord">确认</el-button></template>
    </el-dialog>
    <el-dialog v-model="showWarnings" title="库存预警" width="500px">
      <div v-if="warnings">
        <h4 style="color:#ed8936">⚠️ 库存不足 ({{ warnings.lowStock?.length||0 }})</h4>
        <el-tag v-for="s in warnings.lowStock" :key="s.id" type="warning" style="margin:4px">{{ s.name }}({{ s.quantity }})</el-tag>
        <h4 style="color:#e53e3e;margin-top:12px">🔴 已过期 ({{ warnings.expired?.length||0 }})</h4>
        <el-tag v-for="s in warnings.expired" :key="s.id" type="danger" style="margin:4px">{{ s.name }}</el-tag>
        <div v-if="!warnings.lowStock?.length && !warnings.expired?.length" style="text-align:center;padding:20px;color:#a0aec0">无预警 ✅</div>
      </div>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { supplyApi } from '../api'
const supplies = ref<any[]>([]); const total = ref(0); const currentPage = ref(1)
const categoryFilter = ref(''); const showForm = ref(false); const showRecord = ref(false); const showWarnings = ref(false)
const isEdit = ref(false); const editId = ref(0); const currentItem = ref<any>(null)
const recordType = ref('IN'); const recordQty = ref(1); const recordReason = ref(''); const warnings = ref<any>(null)
const form = ref<any>({ name:'', category:'FIRE_EQUIPMENT', model:'', quantity:0, unit:'个', warehouseLocation:'', minStock:5, campusId:1 })
const categoryMap: Record<string,string> = { FIRE_EQUIPMENT:'消防器材', MEDICAL:'急救设备', PROTECTION:'防护用品', COMMUNICATION:'通讯设备', LIGHTING:'照明设备', RESCUE:'救援工具', OTHER:'其他' }
const statusMap: Record<string,string> = { NORMAL:'正常', LOW_STOCK:'库存不足', EXPIRED:'已过期', DAMAGED:'已损坏' }
const statusTag: Record<string,string> = { NORMAL:'success', LOW_STOCK:'warning', EXPIRED:'danger', DAMAGED:'danger' }
async function loadData() { try { const r:any = await supplyApi.getSupplies(1, currentPage.value-1, 20, categoryFilter.value||undefined); if(r.code===200){supplies.value=r.data?.content||[];total.value=r.data?.totalElements||0} } catch { supplies.value=[] } }
function openCreate() { isEdit.value=false; form.value={name:'',category:'FIRE_EQUIPMENT',model:'',quantity:0,unit:'个',warehouseLocation:'',minStock:5,campusId:1}; showForm.value=true }
function openEdit(row:any) { isEdit.value=true; editId.value=row.id; form.value={...row}; showForm.value=true }
async function handleSubmit() { if(isEdit.value){await supplyApi.update(editId.value,form.value)}else{await supplyApi.create(form.value)}; ElMessage.success('成功'); showForm.value=false; loadData() }
function openRecord(row:any, type:string) { currentItem.value=row; recordType.value=type; recordQty.value=1; recordReason.value=''; showRecord.value=true }
async function handleRecord() { await supplyApi.addRecord(currentItem.value.id,{type:recordType.value,quantity:recordQty.value,reason:recordReason.value}); ElMessage.success('操作成功'); showRecord.value=false; loadData() }
async function loadWarnings() { try { const r:any = await supplyApi.getWarnings(1); warnings.value = r.code===200?r.data:{} } catch { warnings.value={} }; showWarnings.value=true }
async function handleDelete(row:any) { await ElMessageBox.confirm('确认删除？','提示',{type:'warning'}); await supplyApi.delete(row.id); ElMessage.success('已删除'); loadData() }
onMounted(()=>loadData())
</script>

<style scoped>
.page-container { max-width: 1400px; }
.toolbar-card { margin-bottom: 16px; }
.toolbar { display: flex; justify-content: space-between; align-items: center; }
</style>
