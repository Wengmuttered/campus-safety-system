@echo off
chcp 65001 >nul
title 高校应急安全管理系统 — Docker 一键启动

echo ============================================================
echo       高校应急安全管理系统 — Docker Compose 部署
echo ============================================================
echo.

:: 检查 Docker
where docker >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] 未检测到 Docker，请安装 Docker Desktop
    echo         下载地址: https://www.docker.com/products/docker-desktop/
    pause
    exit /b 1
)

:: 检查 Docker 是否运行
docker info >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Docker 服务未启动，请先启动 Docker Desktop
    pause
    exit /b 1
)

echo [1/3] Docker 环境检查通过
echo.

:: 构建并启动
echo [2/3] 构建并启动所有服务...
echo       这可能需要几分钟（首次构建需下载依赖）
echo.

cd /d "%~dp0"
docker-compose up -d --build

echo.
echo [3/3] 等待服务就绪...

:: 等待后端健康
set /a RETRY=0
:WAIT_LOOP
if %RETRY% GEQ 90 (
    echo [WARN] 启动超时，请运行 docker-compose logs 查看日志
    goto SHOW_INFO
)
timeout /t 5 /nobreak >nul
set /a RETRY+=1
docker inspect campus-backend --format="{{.State.Health.Status}}" 2>nul | findstr "healthy" >nul
if %ERRORLEVEL% NEQ 0 (
    echo       等待后端就绪... (%RETRY%/90)
    goto WAIT_LOOP
)

:SHOW_INFO
echo.
echo ============================================================
echo       Docker 部署完成！
echo ============================================================
echo.
echo       前端地址:   http://localhost
echo       后端API:    http://localhost:8088
echo       API文档:    http://localhost:8088/doc.html
echo       AI服务:     http://localhost:8089
echo.
echo       演示账号:   admin / admin123
echo                    security01 / 123456
echo                    student01 / 123456
echo.
echo       管理命令:
echo         查看日志:  docker-compose logs -f
echo         停止服务:  docker-compose down
echo         清理数据:  docker-compose down -v
echo ============================================================

start http://localhost
pause
