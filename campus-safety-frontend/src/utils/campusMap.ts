export interface CampusViewport {
  id: number
  name: string
  lng: number
  lat: number
  defaultHeight: number
}

export const TOP_DOWN_PITCH_DEG = -90

// 海南科技职业大学（两校区）
// 美兰校区：海南省海口市美兰区琼山大道18号
// 云龙校区：海南省海口市琼山区云龙镇大学路1号
const CAMPUS_VIEWPORTS: Record<number, CampusViewport> = {
  1: {
    id: 1,
    name: '海南科技职业大学美兰校区',
    // OSM 实测坐标 (WGS-84): 海口市美兰区琼山大道18号
    lng: 110.4032,
    lat: 20.0449,
    defaultHeight: 1500
  },
  2: {
    id: 2,
    name: '海南科技职业大学云龙校区',
    // OSM 实测坐标 (WGS-84): 海口市琼山区云龙镇云定路118号
    lng: 110.4573,
    lat: 19.8598,
    defaultHeight: 1500
  }
}

export function getCampusViewport(campusId: number): CampusViewport {
  return CAMPUS_VIEWPORTS[campusId] || CAMPUS_VIEWPORTS[1]
}
