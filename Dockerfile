
FROM alpine:latest

RUN apk add --no-cache ca-certificates bash curl gettext

RUN set -ex &&

latest_version=$(curl -s  | grep tag_name | cut -d '"' -f 4) && 

wget -O /tmp/xray.zip "{latest_version}/Xray-linux-64.zip" &&

mkdir -p /tmp/xray_files &&

unzip /tmp/xray.zip -d /tmp/xray_files &&

cp /tmp/xray_files/xray /usr/bin/xray || cp /tmp/xray_files/Xray /usr/bin/xray &&

chmod +x /usr/bin/xray &&

rm -rf /tmp/xray.zip /tmp/xray_files

COPY config.template.json /etc/xray/config.template.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
