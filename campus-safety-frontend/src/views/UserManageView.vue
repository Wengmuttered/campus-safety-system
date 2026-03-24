<template>
  <div class="user-page fade-in-up">
    <div class="page-header">
      <el-button type="primary" @click="showRegister = true">
        <el-icon><Plus /></el-icon> 新增用户
      </el-button>
      <el-select v-model="roleFilter" placeholder="按角色筛选" clearable style="width: 150px"
                 @change="loadUsers">
        <el-option label="管理员" value="ADMIN" />
        <el-option label="安保人员" value="SECURITY" />
        <el-option label="教师" value="TEACHER" />
        <el-option label="学生" value="STUDENT" />
      </el-select>
    </div>

    <el-card>
      <el-table :data="filteredUsers" stripe>
        <el-table-column prop="id" label="ID" width="60" />
        <el-table-column prop="username" label="用户名" width="120" />
        <el-table-column prop="realName" label="姓名" width="100" />
        <el-table-column prop="role" label="角色" width="120">
          <template #default="{ row }">
            <el-tag :type="roleTagType(row.role)" size="small">{{ roleMap[row.role] }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="phone" label="手机号" width="130" />
        <el-table-column prop="email" label="邮箱" min-width="160" show-overflow-tooltip />
        <el-table-column prop="department" label="部门" width="160" show-overflow-tooltip />
        <el-table-column prop="enabled" label="状态" width="80">
          <template #default="{ row }">
            <el-tag :type="row.enabled ? 'success' : 'danger'" size="small">
              {{ row.enabled ? '启用' : '禁用' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="240" fixed="right">
          <template #default="{ row }">
            <el-button link type="primary" size="small" @click="editUser(row)">编辑</el-button>
            <el-dropdown trigger="click" @command="(cmd: string) => changeRole(row.id, cmd)">
              <el-button link type="primary" size="small">角色</el-button>
              <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item command="ADMIN">管理员</el-dropdown-item>
                  <el-dropdown-item command="SECURITY">安保人员</el-dropdown-item>
                  <el-dropdown-item command="TEACHER">教师</el-dropdown-item>
                  <el-dropdown-item command="STUDENT">学生</el-dropdown-item>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
            <el-button link :type="row.enabled ? 'danger' : 'success'" size="small"
                       @click="toggleUser(row.id)">
              {{ row.enabled ? '禁用' : '启用' }}
            </el-button>
            <el-popconfirm title="确定重置密码为123456？" @confirm="resetPwd(row.id)">
              <template #reference>
                <el-button link type="warning" size="small">重置密码</el-button>
              </template>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>

      <div class="pagination-wrapper">
        <el-pagination
          v-model:current-page="currentPage"
          v-model:page-size="pageSize"
          :total="totalUsers"
          :page-sizes="[10, 20, 50]"
          layout="total, sizes, prev, pager, next"
          @size-change="loadUsers"
          @current-change="loadUsers"
        />
      </div>
    </el-card>

    <!-- 新增用户弹窗 -->
    <el-dialog v-model="showRegister" title="新增用户" width="500px">
      <el-form :model="newUser" label-width="80px">
        <el-form-item label="用户名"><el-input v-model="newUser.username" /></el-form-item>
        <el-form-item label="密码"><el-input v-model="newUser.password" type="password" placeholder="默认123456" /></el-form-item>
        <el-form-item label="姓名"><el-input v-model="newUser.realName" /></el-form-item>
        <el-form-item label="角色">
          <el-select v-model="newUser.role" style="width:100%">
            <el-option label="管理员" value="ADMIN" />
            <el-option label="安保人员" value="SECURITY" />
            <el-option label="教师" value="TEACHER" />
            <el-option label="学生" value="STUDENT" />
          </el-select>
        </el-form-item>
        <el-form-item label="手机号"><el-input v-model="newUser.phone" /></el-form-item>
        <el-form-item label="邮箱"><el-input v-model="newUser.email" /></el-form-item>
        <el-form-item label="部门"><el-input v-model="newUser.department" /></el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showRegister = false">取消</el-button>
        <el-button type="primary" @click="registerUser">创建</el-button>
      </template>
    </el-dialog>

    <!-- 编辑用户弹窗 -->
    <el-dialog v-model="showEdit" title="编辑用户" width="500px">
      <el-form :model="editForm" label-width="80px">
        <el-form-item label="姓名"><el-input v-model="editForm.realName" /></el-form-item>
        <el-form-item label="手机号"><el-input v-model="editForm.phone" /></el-form-item>
        <el-form-item label="邮箱"><el-input v-model="editForm.email" /></el-form-item>
        <el-form-item label="部门"><el-input v-model="editForm.department" /></el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="showEdit = false">取消</el-button>
        <el-button type="primary" @click="saveEdit">保存</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { userApi, authApi } from '../api'

const users = ref<any[]>([])
const showRegister = ref(false)
const showEdit = ref(false)
const roleFilter = ref('')
const currentPage = ref(1)
const pageSize = ref(20)
const totalUsers = ref(0)
const editingUserId = ref(0)

const roleMap: Record<string, string> = {
  ADMIN: '管理员', SECURITY: '安保人员', TEACHER: '教师', STUDENT: '学生'
}

function roleTagType(role: string) {
  const m: Record<string, any> = { ADMIN: 'danger', SECURITY: 'warning', TEACHER: '', STUDENT: 'info' }
  return m[role] || 'info'
}

const filteredUsers = computed(() => {
  if (!roleFilter.value) return users.value
  return users.value.filter(u => u.role === roleFilter.value)
})

const newUser = reactive({
  username: '', password: '123456', realName: '', role: 'STUDENT',
  phone: '', email: '', department: '', campusId: 1
})

const editForm = reactive({
  realName: '', phone: '', email: '', department: ''
})

function editUser(user: any) {
  editingUserId.value = user.id
  editForm.realName = user.realName || ''
  editForm.phone = user.phone || ''
  editForm.email = user.email || ''
  editForm.department = user.department || ''
  showEdit.value = true
}

async function registerUser() {
  try {
    const res: any = await authApi.register(newUser)
    if (res.code === 200) {
      ElMessage.success('用户已创建')
      showRegister.value = false
      newUser.username = ''; newUser.realName = ''; newUser.phone = ''; newUser.email = ''; newUser.department = ''
      loadUsers()
    } else {
      ElMessage.error(res.message || '创建失败')
    }
  } catch { ElMessage.error('创建失败') }
}

async function saveEdit() {
  try {
    const res: any = await userApi.updateUser(editingUserId.value, { ...editForm })
    if (res.code === 200) {
      ElMessage.success('更新成功')
      showEdit.value = false
      loadUsers()
    }
  } catch { ElMessage.error('更新失败') }
}

async function changeRole(id: number, role: string) {
  try {
    const res: any = await userApi.updateRole(id, role)
    if (res.code === 200) { ElMessage.success('角色已更新'); loadUsers() }
  } catch { ElMessage.error('更新失败') }
}

async function toggleUser(id: number) {
  try {
    const res: any = await userApi.toggleEnabled(id)
    if (res.code === 200) { ElMessage.success(res.message); loadUsers() }
  } catch { ElMessage.error('操作失败') }
}

async function resetPwd(id: number) {
  try {
    const res: any = await userApi.resetPassword(id)
    if (res.code === 200) ElMessage.success('密码已重置为 123456')
  } catch { ElMessage.error('重置失败') }
}

async function loadUsers() {
  try {
    const res: any = await userApi.getUsers(currentPage.value - 1, pageSize.value)
    if (res.code === 200) {
      users.value = res.data?.content || []
      totalUsers.value = res.data?.totalElements || 0
    }
  } catch { /* ignore */ }
}

onMounted(loadUsers)
</script>

<style scoped>
.page-header { display: flex; gap: 12px; margin-bottom: 20px; align-items: center; }
.user-page { display: flex; flex-direction: column; gap: 16px; }
.pagination-wrapper {
  display: flex;
  justify-content: flex-end;
  margin-top: 20px;
  padding-top: 16px;
  border-top: 1px solid var(--border-color);
}
</style>
