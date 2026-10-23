export type BasemapLayer = 'light' | 'satellite'

export interface BasemapLayerMeta {
  layer: BasemapLayer
  available: boolean
  format?: string
  minZoom?: number
  maxZoom?: number
  bounds?: string
  tileCount?: number
  attribution?: string
}

export interface BasemapMeta {
  enabled: boolean
  dataDir: string
  defaultLayer: BasemapLayer
  generatedAt: string
  layers: Partial<Record<BasemapLayer, BasemapLayerMeta>>
}

const BASEMAP_STORAGE_KEY = 'campus_safety_basemap_layer'
/** /api/tiles/meta 拉取失败时勿假定离线瓦片存在，避免疯狂请求 404 */
const FALLBACK_META: BasemapMeta = {
  enabled: false,
  dataDir: '',
  defaultLayer: 'light',
  generatedAt: '',
  layers: {
    light: { layer: 'light', available: false, minZoom: 3, maxZoom: 16, format: 'png' },
    satellite: { layer: 'satellite', available: false, minZoom: 3, maxZoom: 16, format: 'jpg' }
  }
}

function parseBooleanEnv(value: string | undefined, defaultValue: boolean) {
  if (value === undefined) return defaultValue
  const normalized = value.trim().toLowerCase()
  if (['1', 'true', 'yes', 'on'].includes(normalized)) return true
  if (['0', 'false', 'no', 'off'].includes(normalized)) return false
  return defaultValue
}

function normalizeLayer(value: string | null | undefined): BasemapLayer {
  return value === 'satellite' ? 'satellite' : 'light'
}

export function getTileApiBase() {
  const raw = (import.meta.env.VITE_TILE_API_BASE || '/api/tiles').trim()
  return raw.endsWith('/') ? raw.slice(0, -1) : raw
}

export function isBasemapSwitchEnabled() {
  return parseBooleanEnv(import.meta.env.VITE_TILE_SWITCH_ENABLED, true)
}

/** 默认 true：使用在线瓦片模板（无需本地 /api/tiles）；设为 false 则走离线 MBTiles */
export function shouldUseOnlineBasemap() {
  return parseBooleanEnv(import.meta.env.VITE_USE_ONLINE_BASEMAP, true)
}

/** 在线底图：carto=开源 OSM+CARTO（默认，WGS84）；osm=OpenStreetMap；gaode / gaode-satellite=高德（GCJ-02，与接口 WGS84 经纬度会错位） */
export type OnlineTileProviderKind = 'carto' | 'osm' | 'gaode' | 'gaode-satellite'

export function getOnlineTileProviderKind(): OnlineTileProviderKind {
  const v = (import.meta.env.VITE_ONLINE_TILE_PROVIDER || 'gaode').trim().toLowerCase()
  if (v === 'carto' || v === 'osm' || v === 'gaode' || v === 'gaode-satellite') return v
  return 'gaode'
}

/**
 * 使用 UrlTemplate 瓦片，不依赖 ArcGIS MapServer 的 f=json（避免证书/代理拦截导致整图失败）
 */
export function createOnlineUrlTemplateImageryProvider(Cesium: any) {
  const kind = getOnlineTileProviderKind()
  const common = { minimumLevel: 0, maximumLevel: 18 }
  switch (kind) {
    case 'osm':
      return new Cesium.UrlTemplateImageryProvider({
        ...common,
        url: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        credit: '© OpenStreetMap contributors'
      })
    case 'gaode':
      return new Cesium.UrlTemplateImageryProvider({
        ...common,
        url: 'https://webrd0{s}.is.autonavi.com/appmaptile?lang=zh_cn&size=1&scale=1&style=8&x={x}&y={y}&z={z}',
        subdomains: ['1', '2', '3', '4'],
        credit: '© 高德地图'
      })
    case 'gaode-satellite':
      return new Cesium.UrlTemplateImageryProvider({
        ...common,
        url: 'https://webst0{s}.is.autonavi.com/appmaptile?style=6&x={x}&y={y}&z={z}',
        subdomains: ['1', '2', '3', '4'],
        credit: '© 高德地图'
      })
    case 'carto':
      return new Cesium.UrlTemplateImageryProvider({
        ...common,
        url: 'https://basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}.png',
        credit: '© OpenStreetMap © CARTO'
      })
    default:
      return new Cesium.UrlTemplateImageryProvider({
        ...common,
        url: 'https://webrd0{s}.is.autonavi.com/appmaptile?lang=zh_cn&size=1&scale=1&style=8&x={x}&y={y}&z={z}',
        subdomains: ['1', '2', '3', '4'],
        credit: '© 高德地图'
      })
  }
}

/**
 * 统一挂载底图：默认高德路网（国内 CDN）；离线模式需后端 /api/tiles 与 mbtiles 就绪且 VITE_USE_ONLINE_BASEMAP=false
 */
export async function applyViewerBasemap(Cesium: any, viewer: any) {
  if (!viewer?.imageryLayers || !Cesium) return

  viewer.imageryLayers.removeAll()

  if (shouldUseOnlineBasemap()) {
    try {
      const provider = createOnlineUrlTemplateImageryProvider(Cesium)
      viewer.imageryLayers.addImageryProvider(provider)
      if (viewer.terrainProvider !== undefined) {
        viewer.terrainProvider = new Cesium.EllipsoidTerrainProvider()
      }
      const kind = getOnlineTileProviderKind()
      console.info(`[地图] 在线底图（${kind}，WGS84 与 GCJ 说明见 basemap.ts 注释）`)
    } catch (e) {
      console.error('[地图] 在线底图加载失败', e)
    }
    return
  }

  try {
    const meta = await fetchBasemapMeta()
    const preferred = getPreferredLayer(meta)
    if (meta?.enabled && meta.layers?.[preferred]?.available !== false) {
      const offline = createOfflineImageryProvider(Cesium, preferred, meta)
      viewer.imageryLayers.addImageryProvider(offline)
      console.info(`[地图] 使用本地离线(${preferred}) 底图`)
    } else {
      console.error('[地图] 本地离线瓦片不可用。请运行 tools/offline_tiles/build_tiles.py 或设置 VITE_USE_ONLINE_BASEMAP=true')
    }
  } catch (e) {
    console.error('[地图] 本地离线瓦片探测失败，请确认后端 /api/tiles/meta:', e)
  }
}

/** 与后端 MapLayerDefinitionDto 对齐；zOrder 小的先加入（底层），大的后加（叠在上面） */
export interface MapLayerDefinitionDto {
  id: number
  layerKey: string
  name: string
  urlTemplate: string
  subdomains?: string
  minZoom: number
  maxZoom: number
  zOrder: number
  visible: boolean
  opacity: number
  credit?: string
}

/** 按数据库配置叠加多图层；至少成功加入一层则返回 true */
export function applyMapLayerDefinitionsFromApi(Cesium: any, viewer: any, layers: MapLayerDefinitionDto[]): boolean {
  if (!viewer?.imageryLayers || !Cesium || !layers?.length) return false
  viewer.imageryLayers.removeAll()
  const sorted = [...layers].sort((a, b) => a.zOrder - b.zOrder)
  let added = 0
  for (const L of sorted) {
    if (!L.visible) continue
    const subs = L.subdomains?.split(',').map((s) => s.trim()).filter(Boolean) ?? []
    const provider = new Cesium.UrlTemplateImageryProvider({
      url: L.urlTemplate,
      minimumLevel: L.minZoom ?? 0,
      maximumLevel: L.maxZoom ?? 18,
      subdomains: subs.length ? subs : undefined,
      credit: L.credit || ''
    })
    const im = viewer.imageryLayers.addImageryProvider(provider)
    im.alpha = Math.max(0, Math.min(1, L.opacity ?? 1))
    im.show = true
    added++
  }
  if (viewer.terrainProvider !== undefined) {
    viewer.terrainProvider = new Cesium.EllipsoidTerrainProvider()
  }
  return added > 0
}

export function saveBasemapLayer(layer: BasemapLayer) {
  localStorage.setItem(BASEMAP_STORAGE_KEY, layer)
}

export function readSavedBasemapLayer() {
  return normalizeLayer(localStorage.getItem(BASEMAP_STORAGE_KEY))
}

export async function fetchBasemapMeta(): Promise<BasemapMeta> {
  try {
    const response = await fetch(`${getTileApiBase()}/meta`, { cache: 'no-store' })
    if (!response.ok) return FALLBACK_META
    const json = await response.json()
    const data = json?.data
    if (!data || typeof data !== 'object') return FALLBACK_META
    return {
      enabled: data.enabled !== false,
      dataDir: data.dataDir || '',
      defaultLayer: normalizeLayer(data.defaultLayer),
      generatedAt: data.generatedAt || '',
      layers: {
        light: data.layers?.light ? { ...data.layers.light, layer: 'light' } : FALLBACK_META.layers.light,
        satellite: data.layers?.satellite ? { ...data.layers.satellite, layer: 'satellite' } : FALLBACK_META.layers.satellite
      }
    }
  } catch {
    return FALLBACK_META
  }
}

export function getPreferredLayer(meta?: BasemapMeta): BasemapLayer {
  const saved = readSavedBasemapLayer()
  if (meta?.layers?.[saved]?.available !== false) return saved

  const envLayer = normalizeLayer(import.meta.env.VITE_BASEMAP_DEFAULT)
  if (meta?.layers?.[envLayer]?.available !== false) return envLayer

  return normalizeLayer(meta?.defaultLayer || 'light')
}

function getCreditText(layer: BasemapLayer, meta?: BasemapMeta) {
  const fromMeta = meta?.layers?.[layer]?.attribution?.trim()
  if (fromMeta) return fromMeta
  if (layer === 'satellite') return 'EOX Sentinel-2 cloudless'
  return 'OpenStreetMap contributors'
}

export function createOfflineImageryProvider(Cesium: any, layer: BasemapLayer, meta?: BasemapMeta) {
  const layerMeta = meta?.layers?.[layer]
  const minimumLevel = Number.isFinite(layerMeta?.minZoom) ? layerMeta?.minZoom : 3
  const maximumLevel = Number.isFinite(layerMeta?.maxZoom) ? layerMeta?.maxZoom : 16

  return new Cesium.UrlTemplateImageryProvider({
    url: `${getTileApiBase()}/${layer}/{z}/{x}/{y}`,
    minimumLevel,
    maximumLevel,
    credit: getCreditText(layer, meta)
  })
}

export function applyOfflineBasemap(options: {
  Cesium: any
  viewer: any
  layer: BasemapLayer
  meta?: BasemapMeta
  currentLayer?: any
}) {
  const { Cesium, viewer, layer, meta, currentLayer } = options
  if (!viewer || !Cesium) return null

  if (currentLayer && viewer.imageryLayers.contains(currentLayer)) {
    viewer.imageryLayers.remove(currentLayer, false)
  }

  const provider = createOfflineImageryProvider(Cesium, layer, meta)
  const imageryLayer = viewer.imageryLayers.addImageryProvider(provider)
  saveBasemapLayer(layer)
  if (viewer.scene?.requestRender) viewer.scene.requestRender()
  return imageryLayer
}

export function configureViewerPerformance(viewer: any) {
  if (!viewer?.scene) return
  const scene = viewer.scene
  scene.requestRenderMode = true
  scene.maximumRenderTimeChange = Infinity
  scene.fog.enabled = false
  if (scene.skyAtmosphere) scene.skyAtmosphere.show = false
  if (scene.postProcessStages?.fxaa) scene.postProcessStages.fxaa.enabled = true

  const ratio = window.devicePixelRatio || 1
  viewer.resolutionScale = Math.min(ratio, 1.5)
}

export function bindLabelVisibility(
  viewer: any,
  onChange: (visible: boolean) => void,
  maxCameraHeight = 5000
) {
  if (!viewer?.camera?.changed) return () => {}

  const update = () => {
    const height = viewer.camera.positionCartographic?.height ?? 0
    onChange(height <= maxCameraHeight)
  }

  const listener = () => update()
  viewer.camera.changed.addEventListener(listener)
  update()

  return () => {
    viewer.camera.changed.removeEventListener(listener)
  }
}
