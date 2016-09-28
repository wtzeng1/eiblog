#!/bin/bash
echo "go build..."
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build && \
mkdir tmp && \
cp -a conf tmp/conf && \
cp -a static tmp/static && \
cp -a views tmp/views && \
cp eiblog tmp/eiblog && \
cp Dockerfile tmp/Dockerfile && \
cd tmp && \
domain="registry.cn-hangzhou.aliyuncs.com" && \
docker build -t $domain/deepzz/eiblog . && \
read -p "是否上传到服务器(y/n):" word && \
if  [ $word = "y" ] ;then
    docker push $domain/deepzz/eiblog
fi
cd .. 
rm -rf tmp