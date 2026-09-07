@echo off
echo ====================================
echo CTF在线工具导航 - 本地开发服务器
echo ====================================
echo.

echo 检查Python环境...
python --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未找到Python，请先安装Python 3.8+
    pause
    exit /b 1
)

echo 检查依赖...
pip show mkdocs >nul 2>&1
if errorlevel 1 (
    echo 首次运行，正在安装依赖...
    pip install -r requirements.txt
    if errorlevel 1 (
        echo [错误] 依赖安装失败
        pause
        exit /b 1
    )
)

echo.
echo 启动开发服务器...
echo 访问地址: http://127.0.0.1:8000
echo 按 Ctrl+C 停止服务器
echo.

mkdocs serve
