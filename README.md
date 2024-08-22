# README

## Docker 部署
项目目录下有``Dockerfile``文件，用于Docker环境一键部署。

1. git clone 博客项目
2. 安装node环境，安装node依赖并生成静态博客文件
3. 部署nginx环境

### 生成Docker镜像
```shell
docker build -t my-blog:latest .
```

### 启动Docker容器
```shell
docker run -itd --name blog -p 80:80 my-blog:latest
```
