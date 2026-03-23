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

app.use(createPinia())
app.use(router)
app.use(ElementPlus, { locale: zhCn })
app.use(VueCesium, {
  cesiumPath: 'https://unpkg.com/cesium@latest/Build/Cesium/Cesium.js'
})

app.mount('#app')
