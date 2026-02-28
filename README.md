### 使用教程
**Docker环境部署**
- 1.更新系统软件包
```
apt update && apt upgrade -y
```
- 2.安装必要的工具
```
apt install -y curl nano
```
- 3.安装docker：
```
bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/DockerInstallation.sh)
```
- 4.安装docker-compose
```
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
```
- 加速镜像
```
curl -L "https://hub.gitmirror.com/https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
```

### Docker-compose配置 

```yml      
services:
  npm:
    image: jc21/nginx-proxy-manager:latest
    container_name: npm
    restart: always
    ports:
      - "80:80"
      - "81:81"
      - "443:443"
    volumes:
      - ./npm/data:/data
      - ./npm/letsencrypt:/etc/letsencrypt
    networks:
      - xray_net

  xray:
    image: ghcr.io/caojiaxia/xray-docker:latest
    container_name: xray
    restart: always
    environment:
      UUID: xxxxxx     #你的UUID
      XPATH: /xxxxxx   #你的路径
    networks:
      - xray_net
    depends_on:
      - npm

networks:
  xray_net:
    driver: bridge
```

###   NPM设置   
**为了数据安全，请自行去CF做端口转发** 
   - 为你的NPM面板解析一个域名（你的服务器IP）然后把端口转发到 81

| 选项        | 说明                                                                      |
| ----------- | --------------------------------------------------------------------      |
| Scheme | http                                                                           |
| Forward Hostname / IP   | 你的xray镜像名称或者直接填xray                                  |
| Forward Port   | 默认10000  也可以自己设置  打开`config.template.json`修改`"port": 10000`  |
| Websockets Support | 必须打开                                                             |
| Force SSL | 必须打开                                                                     |
| HTTP/2 Support | 必须打开                                                                     |

