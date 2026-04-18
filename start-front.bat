@echo off
echo ==========================================
echo  启动海棠ERP前端服务 (端口3000)
echo ==========================================
cd /d d:\erp\haitang-erp-ui

echo.
echo 检查node_modules...
if not exist "node_modules" (
    echo 正在安装依赖，请稍候...
    call npm install
    if errorlevel 1 (
        echo 安装依赖失败，请检查网络连接
        pause
        exit /b 1
    )
)

echo.
echo 启动前端开发服务器 (端口3000)...
set VITE_APP_PORT=3000
call npm run dev

pause
