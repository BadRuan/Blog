---
title: Linux安装Node.js
date: 2024-02-17 20:49:05
tags: 
- linux
categories:
- linux
---

1、官网下载：
[https://nodejs.cn/download/](https://nodejs.cn/download/)

![](/images/2024-02-17/Snipaste_2024-02-18_20-01-57.png)

下载命令：
```bash
wget https://npmmirror.com/mirrors/node/v18.19.0/node-v18.19.0-linux-x64.tar.xz
```

![](/images/2024-02-17/Snipaste_2024-02-18_20-05-03.png)

2、解压：
```bash
tar -xf node-v18.19.0-linux-x64.tar.xz
```

3、确认：
```bash
cd node-v18.19.0-linux-x64
./bin/node -v
```

4、改名并移动
```bash
mv node-v18.19.0-linux-x64/* /usr/local/nodejs
```

5、建立软连接
```bash
sudo ln -s /usr/local/nodejs/bin/node /usr/local/bin/
sudo ln -s /usr/local/nodejs/bin/npm /usr/local/bin/
```

6、最终确认
```bash
node -v
npm -v
```