
FROM alpine:latest

# 必须安装 gettext 才能使用 envsubst
RUN apk add --no-cache ca-certificates bash curl gettext

# 下载 Xray (略，保持之前的逻辑...)
# ... 

# 关键修正点：
COPY config.template.json /etc/xray/config.template.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
