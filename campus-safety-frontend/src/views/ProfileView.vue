<template>
  <div class="page-container fade-in-up">
    <el-row :gutter="24">
      <!-- 左侧：个人信息卡 -->
      <el-col :span="8">
        <el-card class="profile-card">
          <div class="profile-header">
            <div class="avatar-wrap">
              <el-avatar :size="80" class="avatar-lg">{{ userStore.realName?.charAt(0) || 'U' }}</el-avatar>
            </div>
            <h3>{{ profile.realName || userStore.username }}</h3>
            <el-tag :type="roleTag[profile.role]" size="small">{{ roleMap[profile.role] || profile.role }}</el-tag>
            <p class="dept">{{ profile.department || '未设置部门' }}</p>
          </div>
          <el-divider />
          <div class="info-list">
            <div class="info-item"><el-icon><User /></el-icon><span>用户名：{{ profile.username }}</span></div>
            <div class="info-item"><el-icon><Phone /></el-icon><span>手机：{{ profile.phone || '未设置' }}</span></div>
            <div class="info-item"><el-icon><Message /></el-icon><span>邮箱：{{ profile.email || '未设置' }}</span></div>
            <div class="info-item"><el-icon><Calendar /></el-icon><span>注册：{{ fmt(profile.createdAt) }}</span></div>
          </div>
        </el-card>
      </el-col>

      <!-- 右侧：编辑区 -->
      <el-col :span="16">
        <el-card>
          <el-tabs v-model="activeTab">
            <!-- 基本信息 -->
            <el-tab-pane label="基本信息" name="info">
              <el-form :model="infoForm" label-width="80px" style="max-width:480px;padding-top:12px">
                <el-form-item label="真实姓名"><el-input v-model="infoForm.realName" /></el-form-item>
                <el-form-item label="手机号"><el-input v-model="infoForm.phone" /></el-form-item>
                <el-form-item label="邮箱"><el-input v-model="infoForm.email" /></el-form-item>
                <el-form-item label="部门"><el-input v-model="infoForm.department" /></el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="saveInfo">保存修改</el-button>
                </el-form-item>
              </el-form>
            </el-tab-pane>

            <!-- 修改密码 -->
            <el-tab-pane label="修改密码" name="password">
              <el-form :model="pwdForm" label-width="100px" style="max-width:480px;padding-top:12px">
                <el-form-item label="原密码"><el-input v-model="pwdForm.oldPassword" type="password" show-password /></el-form-item>
                <el-form-item label="新密码"><el-input v-model="pwdForm.newPassword" type="password" show-password /></el-form-item>
                <el-form-item label="确认新密码"><el-input v-model="pwdForm.confirmPassword" type="password" show-password /></el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="changePassword">修改密码</el-button>
                </el-form-item>
              </el-form>
            </el-tab-pane>

            <!-- 安全概况 -->
            <el-tab-pane label="安全概况" name="overview">
              <div class="overview-grid">
                <div class="overview-card" style="background:var(--gradient-primary)">
                  <span class="ov-value">{{ overview.inspections ?? '—' }}</span>
                  <span class="ov-label">我的巡检</span>
                </div>
                <div class="overview-card" style="background:var(--gradient-warning)">
                  <span class="ov-value">{{ overview.hazards ?? '—' }}</span>
                  <span class="ov-label">上报隐患</span>
                </div>
                <div class="overview-card" style="background:var(--gradient-success)">
                  <span class="ov-value">{{ overview.trainings ?? '—' }}</span>
                  <span class="ov-label">培训课程</span>
                </div>
                <div class="overview-card" style="background:var(--gradient-danger)">
                  <span class="ov-value">{{ overview.duties ?? '—' }}</span>
                  <span class="ov-label">值班记录</span>
                </div>
              </div>
            </el-tab-pane>
          </el-tabs>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { useUserStore } from '../stores/user'
import api from '../api'

const userStore = useUserStore()
const activeTab = ref('info')
const profile = ref<any>({})
const overview = ref<any>({})
const infoForm = ref({ realName: '', phone: '', email: '', department: '' })
const pwdForm = ref({ oldPassword: '', newPassword: '', confirmPassword: '' })

const roleMap: Record<string, string> = { ADMIN: '系统管理员', SECURITY: '安保人员', TEACHER: '教师', STUDENT: '学生' }
const roleTag: Record<string, string> = { ADMIN: 'danger', SECURITY: 'warning', TEACHER: '', STUDENT: 'success' }

function fmt(t: string) { return t ? t.replace('T', ' ').substring(0, 16) : '' }

async function loadProfile() {
  try {
    const r: any = await api.get('/profile')
    if (r.code === 200) {
      profile.value = r.data
      infoForm.value = {
        realName: r.data.realName || '',
        phone: r.data.phone || '',
        email: r.data.email || '',
        department: r.data.department || ''
      }
    }
  } catch { profile.value = { username: userStore.username, realName: userStore.realName, role: userStore.role } }
}

async function saveInfo() {
  try {
    const r: any = await api.put('/profile', infoForm.value)
    if (r.code === 200) {
      ElMessage.success('信息已更新')
      profile.value = { ...profile.value, ...infoForm.value }
      // 同步到 store
      if (infoForm.value.realName) {
        const info = JSON.parse(localStorage.getItem('userInfo') || '{}')
        info.realName = infoForm.value.realName
        localStorage.setItem('userInfo', JSON.stringify(info))
        userStore.loadFromStorage()
      }
    }
  } catch { /**/ }
}

async function changePassword() {
  if (!pwdForm.value.oldPassword || !pwdForm.value.newPassword) {
    ElMessage.warning('请填写完整'); return
  }
  if (pwdForm.value.newPassword !== pwdForm.value.confirmPassword) {
    ElMessage.warning('两次密码不一致'); return
  }
  if (pwdForm.value.newPassword.length < 6) {
    ElMessage.warning('密码至少6位'); return
  }
  try {
    const r: any = await api.put('/profile/password', {
      oldPassword: pwdForm.value.oldPassword,
      newPassword: pwdForm.value.newPassword
    })
    if (r.code === 200) {
      ElMessage.success('密码修改成功')
      pwdForm.value = { oldPassword: '', newPassword: '', confirmPassword: '' }
    } else {
      ElMessage.error(r.message || '修改失败')
    }
  } catch { /**/ }
}

onMounted(() => loadProfile())
</script>

<style scoped>
.page-container { max-width: 1200px; }
.profile-card { text-align: center; }
.profile-header { padding: 20px 0; }
.avatar-wrap { margin-bottom: 12px; }
.avatar-lg { background: var(--gradient-primary); color: #fff; font-size: 32px; font-weight: 700; }
.profile-header h3 { margin: 8px 0 6px; color: var(--text-primary); font-size: 18px; }
.dept { color: var(--text-secondary); font-size: 13px; margin-top: 6px; }
.info-list { text-align: left; padding: 4px 0; }
.info-item { display: flex; align-items: center; gap: 10px; padding: 10px 0; color: var(--text-secondary); font-size: 14px; border-bottom: 1px solid var(--border-color); }
.info-item:last-child { border-bottom: none; }
.overview-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 16px; padding: 12px 0; }
.overview-card { padding: 24px; border-radius: var(--radius); text-align: center; display: flex; flex-direction: column; gap: 6px; }
.ov-value { font-size: 28px; font-weight: 700; color: #fff; }
.ov-label { font-size: 13px; color: rgba(255,255,255,0.8); }
</style>
