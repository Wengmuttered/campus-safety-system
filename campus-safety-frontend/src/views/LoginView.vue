<template>
  <div class="login-page">
    <div class="login-bg">
      <div class="particles" v-for="n in 20" :key="n" :style="particleStyle(n)"></div>
    </div>
    
    <div class="login-container fade-in-up">
      <div class="login-header">
        <div class="login-icon">
          <el-icon :size="48" color="#e53e3e"><Warning /></el-icon>
        </div>
        <h1 class="login-title">高校应急安全管理系统</h1>
        <p class="login-subtitle">Campus Emergency Safety Management</p>
      </div>

      <el-form ref="formRef" :model="form" :rules="rules" class="login-form">
        <el-form-item prop="username">
          <el-input
            v-model="form.username"
            placeholder="请输入用户名"
            size="large"
            prefix-icon="User"
          />
        </el-form-item>
        <el-form-item prop="password">
          <el-input
            v-model="form.password"
            type="password"
            placeholder="请输入密码"
            size="large"
            prefix-icon="Lock"
            show-password
            @keyup.enter="handleLogin"
          />
        </el-form-item>
        <el-form-item>
          <el-button
            type="primary"
            size="large"
            class="login-btn"
            :loading="loading"
            @click="handleLogin"
          >
            {{ loading ? '登录中...' : '登 录' }}
          </el-button>
        </el-form-item>
      </el-form>

      <div class="demo-accounts">
        <p class="demo-title">演示账号</p>
        <div class="demo-list">
          <span class="demo-item" @click="fillDemo('admin', 'admin123')">管理员</span>
          <span class="demo-item" @click="fillDemo('security01', '123456')">安保人员</span>
          <span class="demo-item" @click="fillDemo('student01', '123456')">学生</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage, type FormInstance } from 'element-plus'
import { authApi } from '../api'
import { useUserStore } from '../stores/user'

const router = useRouter()
const userStore = useUserStore()
const formRef = ref<FormInstance>()
const loading = ref(false)

const form = reactive({
  username: '',
  password: ''
})

const rules = {
  username: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
  password: [{ required: true, message: '请输入密码', trigger: 'blur' }]
}

async function handleLogin() {
  const valid = await formRef.value?.validate().catch(() => false)
  if (!valid) return

  loading.value = true
  try {
    const res: any = await authApi.login(form)
    if (res.code === 200) {
      userStore.setUser(res.data)
      ElMessage.success('登录成功')
      router.push('/dashboard')
    } else {
      ElMessage.error(res.message || '登录失败')
    }
  } catch {
    ElMessage.error('登录失败，请检查网络连接')
  } finally {
    loading.value = false
  }
}

function fillDemo(username: string, password: string) {
  form.username = username
  form.password = password
}

function particleStyle(_n: number) {
  const size = Math.random() * 4 + 2
  return {
    width: `${size}px`,
    height: `${size}px`,
    left: `${Math.random() * 100}%`,
    top: `${Math.random() * 100}%`,
    animationDelay: `${Math.random() * 5}s`,
    animationDuration: `${Math.random() * 3 + 3}s`
  }
}
</script>

<style scoped>
.login-page {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;
  background: radial-gradient(ellipse at 20% 50%, #1a365d 0%, #0f1923 60%);
}

.login-bg {
  position: absolute;
  inset: 0;
  overflow: hidden;
}

.particles {
  position: absolute;
  background: rgba(99, 179, 237, 0.3);
  border-radius: 50%;
  animation: float infinite ease-in-out;
}

@keyframes float {
  0%, 100% { transform: translateY(0) scale(1); opacity: 0.3; }
  50% { transform: translateY(-30px) scale(1.3); opacity: 0.8; }
}

.login-container {
  width: 420px;
  padding: 48px 40px;
  background: rgba(26, 35, 50, 0.9);
  border: 1px solid rgba(99, 179, 237, 0.15);
  border-radius: 20px;
  backdrop-filter: blur(20px);
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
  position: relative;
  z-index: 1;
}

.login-header {
  text-align: center;
  margin-bottom: 36px;
}

.login-icon {
  margin-bottom: 16px;
}

.login-title {
  font-size: 24px;
  font-weight: 700;
  background: linear-gradient(135deg, #63b3ed, #4299e1);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  margin-bottom: 8px;
}

.login-subtitle {
  font-size: 12px;
  color: var(--text-secondary);
  letter-spacing: 2px;
  text-transform: uppercase;
}

.login-form {
  margin-top: 24px;
}

.login-form :deep(.el-input__wrapper) {
  background: rgba(15, 25, 35, 0.8);
  border: 1px solid var(--border-color);
  border-radius: 10px;
  box-shadow: none !important;
  padding: 4px 12px;
}

.login-form :deep(.el-input__wrapper:hover),
.login-form :deep(.el-input__wrapper.is-focus) {
  border-color: #4299e1;
}

.login-form :deep(.el-input__inner) {
  color: var(--text-primary);
}

.login-btn {
  width: 100%;
  height: 48px;
  border-radius: 10px;
  font-size: 16px;
  font-weight: 600;
  background: linear-gradient(135deg, #4299e1, #3182ce) !important;
  border: none !important;
  transition: all 0.3s;
}

.login-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 25px rgba(66, 153, 225, 0.4);
}

.demo-accounts {
  margin-top: 24px;
  padding-top: 20px;
  border-top: 1px solid var(--border-color);
  text-align: center;
}

.demo-title {
  font-size: 12px;
  color: var(--text-secondary);
  margin-bottom: 12px;
}

.demo-list {
  display: flex;
  gap: 12px;
  justify-content: center;
}

.demo-item {
  font-size: 12px;
  color: #63b3ed;
  cursor: pointer;
  padding: 4px 12px;
  border: 1px solid rgba(99, 179, 237, 0.3);
  border-radius: 6px;
  transition: all 0.2s;
}

.demo-item:hover {
  background: rgba(99, 179, 237, 0.1);
  border-color: #63b3ed;
}
</style>
