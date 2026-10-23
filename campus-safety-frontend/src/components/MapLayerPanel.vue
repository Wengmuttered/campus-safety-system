<template>
  <div class="map-layer-panel">
    <div v-if="!hideTitle" class="map-layer-title-row">
      <div class="map-layer-title">图层目录</div>
      <el-button v-if="showClose" text type="primary" size="small" @click="emit('close')">收起</el-button>
    </div>
    <div class="map-layer-hint">顺序：下→上；zOrder 小的先绘制（底），影像在上层可调透明度</div>
    <div v-for="row in layers" :key="row.id" class="map-layer-row">
      <div class="row-head">
        <el-checkbox
          :model-value="row.visible"
          @update:model-value="(v: boolean | string | number) => onVisibleChange(row, !!v)"
        >
          {{ row.name }}
        </el-checkbox>
      </div>
      <div class="row-opacity">
        <span class="op-label">透明度</span>
        <el-slider
          :model-value="Math.round(row.opacity * 100)"
          :disabled="!row.visible"
          :show-tooltip="true"
          @change="(v: number) => onOpacityCommit(row, v)"
        />
      </div>
    </div>
    <div v-if="layers.length === 0" class="map-layer-empty">暂无图层配置（请启动后端并访问 /api/map/layers）</div>
  </div>
</template>

<script setup lang="ts">
import { mapLayerApi } from '../api'
import type { MapLayerDefinitionDto } from '../utils/basemap'

withDefaults(
  defineProps<{
    layers: MapLayerDefinitionDto[]
    showClose?: boolean
    /** 外层已有标题（如 el-drawer）时隐藏内层标题行 */
    hideTitle?: boolean
  }>(),
  { showClose: false, hideTitle: false }
)

const emit = defineEmits<{
  reapply: []
  close: []
}>()

async function onVisibleChange(row: MapLayerDefinitionDto, visible: boolean) {
  try {
    await mapLayerApi.patch(row.id, { visible })
    emit('reapply')
  } catch {
    /* api 拦截器已提示 */
  }
}

async function onOpacityCommit(row: MapLayerDefinitionDto, percent: number) {
  try {
    await mapLayerApi.patch(row.id, { opacity: Math.max(0, Math.min(1, percent / 100)) })
    emit('reapply')
  } catch {
    /* api 拦截器已提示 */
  }
}
</script>

<style scoped>
.map-layer-panel {
  background: rgba(13, 22, 38, 0.92);
  border: 1px solid rgba(66, 153, 225, 0.45);
  border-radius: 8px;
  padding: 12px 14px;
  max-height: 420px;
  overflow-y: auto;
  box-shadow: 0 8px 28px rgba(0, 0, 0, 0.55);
  backdrop-filter: blur(8px);
  color: #e2e8f0;
  font-size: 13px;
}
.map-layer-title-row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 8px;
  margin-bottom: 6px;
}
.map-layer-title {
  font-weight: 700;
  color: #63b3ed;
  font-size: 14px;
}
.map-layer-hint {
  font-size: 11px;
  color: #718096;
  margin-bottom: 10px;
  line-height: 1.35;
}
.map-layer-row {
  border-bottom: 1px solid rgba(255, 255, 255, 0.06);
  padding: 8px 0;
}
.map-layer-row:last-child {
  border-bottom: none;
}
.row-head :deep(.el-checkbox__label) {
  color: #e2e8f0;
}
.row-opacity {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-top: 6px;
  padding-left: 24px;
}
.op-label {
  width: 42px;
  flex-shrink: 0;
  color: #a0aec0;
  font-size: 12px;
}
.row-opacity :deep(.el-slider) {
  flex: 1;
}
.map-layer-empty {
  color: #718096;
  font-size: 12px;
  padding: 8px 0;
}
</style>
