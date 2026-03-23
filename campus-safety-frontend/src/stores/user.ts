import { defineStore } from 'pinia'
import { ref } from 'vue'

export const useUserStore = defineStore('user', () => {
  const token = ref(localStorage.getItem('token') || '')
  const userId = ref<number | null>(null)
  const username = ref('')
  const realName = ref('')
  const role = ref('')

  function setUser(data: any) {
    token.value = data.token
    userId.value = data.userId
    username.value = data.username
    realName.value = data.realName
    role.value = data.role
    localStorage.setItem('token', data.token)
    localStorage.setItem('userInfo', JSON.stringify(data))
  }

  function loadFromStorage() {
    const info = localStorage.getItem('userInfo')
    if (info) {
      const data = JSON.parse(info)
      userId.value = data.userId
      username.value = data.username
      realName.value = data.realName
      role.value = data.role
    }
  }

  function logout() {
    token.value = ''
    userId.value = null
    username.value = ''
    realName.value = ''
    role.value = ''
    localStorage.removeItem('token')
    localStorage.removeItem('userInfo')
  }

  // 初始化时从localStorage恢复
  loadFromStorage()

  return { token, userId, username, realName, role, setUser, logout, loadFromStorage }
})
