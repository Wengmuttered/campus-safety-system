@echo off
chcp 65001 >nul
title 高校应急安全管理系统 — 一键停止

echo ============================================================
echo       高校应急安全管理系统 — 停止所有服务
echo ============================================================
echo.

:: 停止后端 (Spring Boot 默认端口 8088)
echo [1/3] 停止后端服务...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8088" ^| findstr "LISTENING"') do (
    echo       正在终止 PID: %%a
    taskkill /PID %%a /F >nul 2>nul
)

:: 停止 AI 服务 (端口 8089)
echo [2/3] 停止 AI 服务...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8089" ^| findstr "LISTENING"') do (
    echo       正在终止 PID: %%a
    taskkill /PID %%a /F >nul 2>nul
)

:: 停止前端 (Vite 默认端口 5173)
echo [3/3] 停止前端服务...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":5173" ^| findstr "LISTENING"') do (
    echo       正在终止 PID: %%a
    taskkill /PID %%a /F >nul 2>nul
)

:: 清理残余 Node 进程
taskkill /IM "node.exe" /F >nul 2>nul

echo.
echo ============================================================
echo       所有服务已停止
echo ============================================================
pause
