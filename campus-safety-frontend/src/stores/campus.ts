import { defineStore } from 'pinia'
import { ref } from 'vue'
import { mapApi } from '../api'

const CANONICAL_CAMPUS_NAME: Record<number, string> = {
  1: '海南科技职业大学美兰校区',
  2: '海南科技职业大学云龙校区'
}

function normalizeCampusList(items: any[]): any[] {
  if (!Array.isArray(items)) return []
  return items.map((item: any) => {
    const id = Number(item?.id)
    return {
      ...item,
      id,
      name: CANONICAL_CAMPUS_NAME[id] || item?.name || `校区 ${id}`
    }
  })
}

export const useCampusStore = defineStore('campus', () => {
  const currentCampusId = ref<number>(Number(localStorage.getItem('campusId')) || 1)
  const campusList = ref<any[]>([])

  async function loadCampuses() {
    try {
      const res: any = await mapApi.getCampuses()
      if (res.code === 200) {
        campusList.value = normalizeCampusList(res.data || [])
        // 如果当前选中的校区不在列表中，重置为第一个
        if (campusList.value.length > 0 && !campusList.value.find((c: any) => c.id === currentCampusId.value)) {
          setCampus(campusList.value[0].id)
        }
      }
    } catch {
      // 回退默认
      campusList.value = [
        { id: 1, name: CANONICAL_CAMPUS_NAME[1] },
        { id: 2, name: CANONICAL_CAMPUS_NAME[2] }
      ]
    }
  }

  function setCampus(id: number) {
    currentCampusId.value = id
    localStorage.setItem('campusId', String(id))
  }

  return { currentCampusId, campusList, loadCampuses, setCampus }
})
