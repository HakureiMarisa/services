#!/bin/sh

sudo sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
sudo sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

sudo timedatectl set-timezone Asia/Shanghai

sudo apt-get update
sudo apt-get install -y bash-completion vim wget zip curl

