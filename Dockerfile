FROM bitnami/git:latest as git_clone
WORKDIR /app
RUN git clone https://gitee.com/ruanfumin/static_blog.git

FROM node:21-alpine3.18 as build
WORKDIR /app/blog
COPY --from=git_clone /app/static_blog .
RUN npm install \
        && npm run build

FROM nginx:latest
WORKDIR /usr/share/nginx/html
COPY --from=build /app/blog/public .
EXPOSE 80
