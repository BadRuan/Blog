# README

## Welcome to my blog.

## Docker 部署
项目目录下有``Dockerfile``文件，用于Docker环境一键部署。

### 通过Dockerfile生成Docker镜像
```shell
docker build -t my-blog:v1 .
```

### 启动Docker镜像
```shell
docker run -itd --name blog -P my-blog:v1
```

### Dockerfile基本步骤
1. git clone 博客项目
2. 安装node环境，安装依赖并生成静态博客文件
3. 部署nginx环境


