#!/bin/bash

echo "使用官方脚本安装docker"
sudo sh -c "$(curl -sSL https://get.docker.com/)"

echo "使用镜像加速"
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://kf5uff7p.mirror.aliyuncs.com"]
}
EOF

echo "重启"
sudo systemctl daemon-reload
sudo systemctl restart docker
echo "设置开机启动"
sudo systemctl enable docker

echo "version:"
sudo docker -v