# 🆘 高校应急安全管理系统

> Campus Emergency Safety Management System

基于 **Spring Boot 3 + Vue 3 + Vue-Cesium + AI** 的智能化校园应急安全管理平台，提供校园3D地图、一键求助报警、应急疏散导航、灾害预警推送、应急演练模拟和AI风险预测等功能。

---

## 🌟 核心功能

| 模块 | 功能说明 | 技术亮点 |
|------|---------|---------|
| 🗺️ 校园3D地图 | 三维校园可视化，建筑物/安全点位标注 | Vue-Cesium + CesiumJS |
| 🆘 一键求助 | SOS紧急报警，实时推送安保人员 | WebSocket (STOMP) |
| 🚨 事件管理 | 安全事件上报、跟踪和处置 | 状态机流转 |
| 🏃 疏散导航 | 应急疏散路线展示与导航 | 路径算法 |
| 📢 灾害预警 | 灾害/安全预警实时推送 | WebSocket 广播 |
| 🎯 应急演练 | 消防/地震等场景模拟演练 | 场景化管理 |
| 🔥 AI风险分析 | 历史事件分析、风险热力图预测 | Python + 机器学习 |

## 🛠️ 技术栈

### 后端
- **Spring Boot 3.2** — Java 21
- **Spring Security** — JWT 无状态认证
- **Spring Data JPA** — 数据持久化
- **PostgreSQL** — 主数据库（+ PostGIS 空间数据）
- **Redis** — 缓存 & 向量存储
- **WebSocket (STOMP)** — 实时消息推送
- **Knife4j 4.5** — API 接口文档

### 前端
- **Vue 3** — TypeScript + Composition API
- **Vite** — 构建工具
- **Vue-Cesium** — 3D 地球/地图引擎
- **Element Plus** — UI 组件库
- **Pinia** — 状态管理
- **Axios** — HTTP 请求

### AI 服务
- **Python** — FastAPI
- **Scikit-learn / PyTorch** — 风险预测模型
- **Pandas / NumPy** — 数据分析

## 📁 项目结构

```
高校应急安全管理系统/
├── campus-safety-backend/        # Spring Boot 后端
│   ├── src/main/java/com/campussafety/
│   │   ├── config/               # 配置类 (Security, CORS, WebSocket, Redis, Knife4j)
│   │   ├── controller/           # REST 控制器
│   │   ├── dto/                  # 数据传输对象
│   │   ├── entity/               # JPA 实体类
│   │   ├── repository/           # 数据访问层
│   │   ├── service/              # 业务逻辑层
│   │   └── util/                 # 工具类 (JWT, ApiResponse)
│   └── src/main/resources/
│       └── application.yml       # 应用配置
│
├── campus-safety-frontend/       # Vue 3 前端
│   └── src/
│       ├── api/                  # API 接口封装
│       ├── layouts/              # 页面布局
│       ├── router/               # 路由配置
│       ├── stores/               # Pinia 状态管理
│       └── views/                # 页面组件
│           ├── LoginView.vue     # 登录页
│           ├── DashboardView.vue # 控制台
│           ├── MapView.vue       # 3D 校园地图
│           ├── AlertView.vue     # 一键求助
│           ├── EventsView.vue    # 事件管理
│           ├── EvacuationView.vue# 疏散导航
│           ├── DrillView.vue     # 应急演练
│           └── RiskView.vue      # 风险分析
│
└── ai-service/                   # Python AI 服务 (规划中)
```

## 🚀 快速启动

### 环境要求
- JDK 21+
- Maven 3.9+
- Node.js 20+
- PostgreSQL 15+
- Redis 7+

### 1. 后端启动

```bash
# 创建数据库
psql -U postgres -c "CREATE DATABASE campus_safety;"

# 进入后端目录
cd campus-safety-backend

# 编译运行
mvn spring-boot:run
```

启动后：
- 后端服务：http://localhost:8088
- API 文档：http://localhost:8088/doc.html

### 2. 前端启动

```bash
cd campus-safety-frontend

npm install
npm run dev
```

启动后访问：http://localhost:5173

### 3. 演示账号

| 角色 | 用户名 | 密码 |
|------|--------|------|
| 管理员 | admin | admin123 |
| 安保人员 | security01 | 123456 |
| 学生 | student01 | 123456 |

## 📊 数据库设计

系统包含 8 张核心数据表：

- `users` — 用户信息（管理员/安保/教师/学生）
- `campuses` — 校区信息
- `buildings` — 建筑物（含坐标、楼层、容量）
- `safety_points` — 安全点位（消防栓/AED/出口/监控等）
- `emergency_events` — 应急事件
- `alert_records` — 报警记录
- `evacuation_routes` — 疏散路线
- `drill_plans` — 演练计划

## 📡 API 接口

| 模块 | 端点 | 方法 | 说明 |
|------|------|------|------|
| 认证 | `/api/auth/login` | POST | 用户登录 |
| 认证 | `/api/auth/register` | POST | 用户注册 |
| 地图 | `/api/map/campuses` | GET | 获取校区列表 |
| 地图 | `/api/map/buildings` | GET | 获取建筑物列表 |
| 点位 | `/api/safety-points` | CRUD | 安全点位管理 |
| 报警 | `/api/alerts/sos` | POST | 一键求助 |
| 事件 | `/api/events` | CRUD | 事件管理 |
| 疏散 | `/api/evacuation/routes` | GET | 疏散路线 |
| 演练 | `/api/drills` | CRUD | 演练管理 |
| 仪表盘 | `/api/dashboard/stats` | GET | 统计数据 |

> 完整 API 文档请启动后端后访问 http://localhost:8088/doc.html

## 📜 License

MIT License

---

> 📌 **2026 计算机设计大赛参赛作品** | 软件应用与开发赛道
