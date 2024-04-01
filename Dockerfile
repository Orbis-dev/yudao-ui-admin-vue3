# 使用 Node.js 14 作为基础镜像
FROM node:18.19.0

# 将当前工作目录设置为/app
WORKDIR /app

# 将 package.json 和 package-lock.json 复制到 /app 目录下
COPY package*.json ./

# 运行 npm install 安装依赖
RUN npm install -g pnpm
RUN pnpm install

# 将源代码复制到 /app 目录下
COPY . .

# 打包构建
RUN npm run build:test

# 将构建后的代码复制到 nginx 镜像中
FROM nginx:latest
COPY --from=0 /app/dist-test /usr/share/nginx/html

# 暴露 8280 端口
EXPOSE 8280

# 启动 nginx 服务
CMD ["nginx", "-g", "daemon off;"]
