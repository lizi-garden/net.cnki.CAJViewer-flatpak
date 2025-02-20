#!/bin/bash

# 获取当前脚本所在的目录（在 Flatpak 沙箱中是 /app/bin）
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# 假设 CAJViewer 可执行文件在 /app/opt/cajviewer 目录下
APP_DIR="/app/opt/cajviewer/"

# 设置 LD_LIBRARY_PATH，优先使用应用自带的库，然后是系统库
export LD_LIBRARY_PATH="${APP_DIR}/lib:${LD_LIBRARY_PATH}:/usr/lib64:/usr/lib:/app/lib"

# 传递所有参数
params=""
for param in "$@"; do
    params="${params} \"${param}\""
done

# 启动 CAJViewer
"${APP_DIR}/bin/CAJViewer" ${params}
