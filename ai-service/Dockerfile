# ============================================================
# 高校应急安全管理系统 — AI 风险分析服务 Docker 镜像
# ============================================================

FROM python:3.11-slim

WORKDIR /app

# 时区设置
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 安装依赖
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

# 复制源码
COPY main.py .

# 健康检查
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8089/api/ai/health')" || exit 1

EXPOSE 8089
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8089"]
