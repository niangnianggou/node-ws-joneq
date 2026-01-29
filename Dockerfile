FROM node:20-alpine3.20

WORKDIR /tmp

# 关键：这里增加了 index.html，确保它被打包进镜像
COPY index.js package.json index.html ./

EXPOSE 3000

RUN apk update && apk add --no-cache bash openssl curl &&\
    chmod +x index.js &&\
    npm install

# 此时 index.html 已经和 index.js 在同一个目录了
CMD ["node", "index.js"]
