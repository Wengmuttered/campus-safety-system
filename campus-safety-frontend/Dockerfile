# ============================================================
# 高校应急安全管理系统 — 前端 Docker 镜像
# 多阶段构建：Node 构建 → Nginx 静态部署
# ============================================================

# ---------- 阶段1：Node 构建 ----------
FROM node:20-alpine AS builder
WORKDIR /build
COPY package.json package-lock.json ./
RUN npm ci --no-audit
COPY . .
RUN npm run build

# ---------- 阶段2：Nginx 部署 ----------
FROM nginx:alpine
# 删除默认配置
RUN rm /etc/nginx/conf.d/default.conf
# 复制自定义配置
COPY nginx.conf /etc/nginx/conf.d/default.conf
# 复制构建产物
COPY --from=builder /build/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
