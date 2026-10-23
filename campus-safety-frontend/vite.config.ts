import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],
  resolve: {
    alias: {
      'vue': 'vue/dist/vue.esm-bundler.js'
    }
  },
  server: {
    proxy: {
      // 后端 API 代理
      '/api': {
        target: 'http://localhost:8088',
        changeOrigin: true
      },
      // WebSocket 代理
      '/ws': {
        target: 'http://localhost:8088',
        ws: true
      }
    }
  }
})
