### Docker-compose配置 ###

```yml      
services:
  xray:
    image: ghcr.io/caojiaxia/xray-enterprise:latest
    container_name: xray-enterprise
    restart: unless-stopped  
    environment:
      - UUID=你的UUID
      - WSPATH=节点路径
      - proxy
networks:
  proxy:
    external: true
```
