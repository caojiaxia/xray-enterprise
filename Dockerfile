FROM teddysun/xray

COPY entrypoint.sh /entrypoint.sh
COPY template.json /template.json

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
