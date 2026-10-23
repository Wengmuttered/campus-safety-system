@echo off
chcp 65001 >nul
title 高校应急安全管理系统 — 一键启动

echo ============================================================
echo       高校应急安全管理系统 — 本地一键启动
echo ============================================================
echo.

:: ====== 环境检查 ======
echo [1/6] 检查运行环境...

where java >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] 未检测到 Java，请安装 JDK 21+
    pause
    exit /b 1
)
for /f "tokens=3" %%i in ('java -version 2^>^&1 ^| findstr /i "version"') do set JAVA_VER=%%i
echo       Java: %JAVA_VER%

where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] 未检测到 Node.js，请安装 Node.js 20+
    pause
    exit /b 1
)
for /f "tokens=1" %%i in ('node -v') do set NODE_VER=%%i
echo       Node: %NODE_VER%

where python >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [WARN]  未检测到 Python，AI 服务将不会启动
    set SKIP_AI=1
) else (
    for /f "tokens=1" %%i in ('python --version 2^>^&1') do set PY_VER=%%i
    echo       Python: %PY_VER%
    set SKIP_AI=0
)

echo.
echo [2/6] 检查数据库连接...

:: 加载环境变量（如果存在 .env 文件）
if exist "%~dp0.env" (
    for /f "usebackq tokens=1,* delims==" %%a in ("%~dp0.env") do (
        set "%%a=%%b" 2>nul
    )
    echo       已加载 .env 配置
)

:: 设置默认值
if not defined DB_HOST set DB_HOST=localhost
if not defined DB_PORT set DB_PORT=5432
if not defined SERVER_PORT set SERVER_PORT=8088
if not defined AI_SERVICE_PORT set AI_SERVICE_PORT=8089
if not defined SPRING_PROFILES_ACTIVE set SPRING_PROFILES_ACTIVE=local

echo       数据库: %DB_HOST%:%DB_PORT%
echo       Spring Profile: %SPRING_PROFILES_ACTIVE%
echo.

:: ====== 启动后端 ======
echo [3/6] 启动后端服务 (端口 %SERVER_PORT%)...
cd /d "%~dp0campus-safety-backend"
start "CampusSafety-Backend" cmd /c "mvn spring-boot:run -Dspring-boot.run.profiles=%SPRING_PROFILES_ACTIVE% 2>&1 | findstr /V /C:"[DEBUG]""
cd /d "%~dp0"
echo       后端启动中，请等待...

:: ====== 启动 AI 服务 ======
if "%SKIP_AI%"=="1" (
    echo [4/6] 跳过 AI 服务 (Python 未安装)
) else (
    echo [4/6] 启动 AI 服务 (端口 %AI_SERVICE_PORT%)...
    cd /d "%~dp0ai-service"
    if not exist "venv" (
        echo       首次启动，创建虚拟环境...
        python -m venv venv
        call venv\Scripts\activate.bat
        pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple -q
    ) else (
        call venv\Scripts\activate.bat
    )
    start "CampusSafety-AI" cmd /c "python main.py"
    cd /d "%~dp0"
    echo       AI 服务启动中...
)

:: ====== 启动前端 ======
echo [5/6] 启动前端服务 (端口 5173)...
cd /d "%~dp0campus-safety-frontend"
if not exist "node_modules" (
    echo       首次启动，安装依赖...
    call npm install
)
start "CampusSafety-Frontend" cmd /c "npm run dev"
cd /d "%~dp0"
echo       前端启动中...

:: ====== 等待并打开浏览器 ======
echo.
echo [6/6] 等待服务就绪...
echo.
echo       后端地址:   http://localhost:%SERVER_PORT%
echo       API文档:    http://localhost:%SERVER_PORT%/doc.html
echo       前端地址:   http://localhost:5173
echo       AI服务:     http://localhost:%AI_SERVICE_PORT%
echo.
echo       演示账号:   admin / admin123
echo                    security01 / 123456
echo                    student01 / 123456
echo.

:: 等待后端就绪
set /a RETRY=0
:WAIT_LOOP
if %RETRY% GEQ 60 (
    echo [WARN] 后端启动超时，请手动检查
    goto OPEN_BROWSER
)
timeout /t 3 /nobreak >nul
set /a RETRY+=1
curl -s -o nul http://localhost:%SERVER_PORT%/doc.html 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo       等待后端就绪... (%RETRY%/60)
    goto WAIT_LOOP
)

:OPEN_BROWSER
echo.
echo ============================================================
echo       所有服务已启动！正在打开浏览器...
echo       按 Ctrl+C 或运行 stop-all.bat 停止所有服务
echo ============================================================
start http://localhost:5173
pause
