Docker-compose配置：

services:
  xray:
    image: ghcr.io/caojiaxia/xray-enterprise:latest
    container_name: xray-enterprise
    restart: unless-stopped
    ports:
      - "10000:10000"    
    environment:
      - UUID=6d5927aa-feaf-4f59-afa0-d02697de744e
      - WSPATH=KMlkkhfyHTVg
    networks:
      - proxy

networks:
  proxy:
    external: true
