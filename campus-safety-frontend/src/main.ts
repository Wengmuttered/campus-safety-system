import { createApp } from 'vue'
import { createPinia } from 'pinia'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import zhCn from 'element-plus/es/locale/lang/zh-cn'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
import VueCesium from 'vue-cesium'
import 'vue-cesium/dist/index.css'

import App from './App.vue'
import router from './router'
import './style.css'

const app = createApp(App)

// 注册 Element Plus 图标
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
  app.component(key, component)
}

// 保存原始 console 方法（VueCesium 会覆写 console.warn/log/error，
// 其 wrapper 在处理对象参数时会抛出 TypeError: Cannot convert object to primitive value，
// 导致 Element Plus resolveComponent 的 warn 调用崩溃，进而所有使用图标组件的页面白屏）
const _origConsole = {
  log: console.log,
  warn: console.warn,
  error: console.error
}

app.use(createPinia())
app.use(router)
app.use(ElementPlus, { locale: zhCn })
app.use(VueCesium, {
  cesiumPath: 'https://unpkg.com/cesium@latest/Build/Cesium/Cesium.js'
})

// 恢复原始 console 方法，防止 VueCesium wrapper 导致渲染崩溃
Object.assign(console, _origConsole)

app.mount('#app')
