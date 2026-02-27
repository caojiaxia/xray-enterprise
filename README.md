✅ 解决方案一（最简单）：服务器登录 GHCR

在你的 VPS 上执行：
docker login ghcr.io

用户名：
你的github用户名

密码：
👉 必须使用 GitHub Personal Access Token（不是 GitHub 密码）

🔥 如何生成 Token
打开 GitHub→
Settings→
Developer settings→
Personal access tokens→
Fine-grained token 或 classic

勾选：
read:packages

生成后复制。

然后在服务器输入：
docker login ghcr.io

输入：
Username: caojiaxia

Password: 你的 token

成功会显示：
Login Succeeded

然后再：
docker compose up -d

就可以正常拉取了。

✅ 解决方案二（推荐）：把 GHCR 镜像改为 Public

如果你不想每台服务器都登录：
打开 GitHub
进入仓库
点击 Packages
点击 xray-enterprise→
Settings→
Change visibility→
改成 Public

这样服务器可以直接拉：
docker pull ghcr.io/caojiaxia/xray-enterprise:v1.0.6

无需登录。
