FROM alpine:latest

# 安装必要依赖
RUN apk add --no-cache ca-certificates bash curl

# 获取最新版 Xray (确保支持 xHTTP)
RUN set -ex && \
    latest_version=$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases/latest | grep tag_name | cut -d '"' -f 4) && \
    wget -O /tmp/xray.zip "https://github.com/XTLS/Xray-core/releases/download/${latest_version}/Xray-linux-64.zip" && \
    unzip /tmp/xray.zip -d /usr/bin/ && \
    chmod +x /usr/bin/xray && \
    rm /tmp/xray.zip

# 暴露端口（根据你的 config.json 决定）
EXPOSE 8443

CMD ["/usr/bin/xray", "-config", "/etc/xray/config.json"]
