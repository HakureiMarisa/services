#!/bin/sh

sudo sed -i "s@http://.*archive.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list
sudo sed -i "s@http://.*security.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list

sudo timedatectl set-timezone Asia/Shanghai

sudo apt-get update
sudo apt-get install -y bash-completion vim wget zip curl

