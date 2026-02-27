Docker-compose配置：
      
services:
  xray:
    image: ghcr.io/caojiaxia/xray-enterprise:latest
    container_name: xray-enterprise
    restart: unless-stopped
    ports:
      - "10000:10000"    
    environment:
      - UUID=你的UUID
      - WSPATH=节点路径
      - proxy

networks:
  proxy:
    external: true
