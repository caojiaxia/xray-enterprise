
#!/bin/sh

UUID=${UUID:-$(cat /proc/sys/kernel/random/uuid)}
WSPATH=${WSPATH:-ws}

sed "s/__UUID__/$UUID/g" /template.json | \
sed "s/__WSPATH__/$WSPATH/g" > /etc/xray/config.json

echo "UUID: $UUID"
echo "WS Path: /$WSPATH"

exec xray -config /etc/xray/config.json
