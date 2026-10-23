# ============================================================
# 高校应急安全管理系统 — 后端 Docker 镜像
# 多阶段构建：Maven 编译 → JRE 运行
# ============================================================

# ---------- 阶段1：Maven 构建 ----------
FROM maven:3.9-eclipse-temurin-21 AS builder
WORKDIR /build
COPY pom.xml .
# 先下载依赖（利用 Docker 缓存）
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn package -DskipTests -B

# ---------- 阶段2：运行 ----------
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app

# 时区设置
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 从构建阶段复制 jar
COPY --from=builder /build/target/*.jar app.jar

# 健康检查
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD curl -f http://localhost:8088/api/auth/login 2>/dev/null || exit 1

EXPOSE 8088
ENTRYPOINT ["java", "-jar", "app.jar"]
