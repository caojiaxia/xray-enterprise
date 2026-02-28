FROM alpine:latest

RUN apk add --no-cache ca-certificates bash curl gettext

# 下载并安装 Xray (保持之前的逻辑)
RUN set -ex && \
    latest_version=$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases/latest | grep tag_name | cut -d '"' -f 4) && \
    wget -O /tmp/xray.zip "https://github.com/XTLS/Xray-core/releases/download/${latest_version}/Xray-linux-64.zip" && \
    unzip /tmp/xray.zip -d /usr/bin/ && \
    chmod +x /usr/bin/xray && \
    rm /tmp/xray.zip

# 复制配置文件模板和启动脚本
COPY config.json /etc/xray/config.template.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
