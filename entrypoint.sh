#!/bin/bash

# 设置默认值（如果环境变量为空）
export UUID=${UUID:-$(cat /proc/sys/kernel/random/uuid)}
export XPATH=${XPATH:-/$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16)}

echo "正在启动 Xray..."
echo "当前使用的 UUID: $UUID"
echo "当前使用的 PATH: $XPATH"

# 使用 envsubst 替换模板中的变量并生成最终配置文件
envsubst '${UUID},${XPATH}' < /etc/xray/config.template.json > /etc/xray/config.json

# 启动 Xray
exec /usr/bin/xray -config /etc/xray/config.json
