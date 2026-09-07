#!/bin/bash

echo "===================================="
echo "CTF在线工具导航 - 本地开发服务器"
echo "===================================="
echo

# 检查Python
if ! command -v python3 &> /dev/null; then
    echo "[错误] 未找到Python3，请先安装Python 3.8+"
    exit 1
fi

echo "检查依赖..."
if ! python3 -c "import mkdocs" 2>/dev/null; then
    echo "首次运行，正在安装依赖..."
    pip3 install -r requirements.txt
    if [ $? -ne 0 ]; then
        echo "[错误] 依赖安装失败"
        exit 1
    fi
fi

echo
echo "启动开发服务器..."
echo "访问地址: http://127.0.0.1:8000"
echo "按 Ctrl+C 停止服务器"
echo

mkdocs serve
