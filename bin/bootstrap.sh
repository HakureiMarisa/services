
ll

myFile="./install.txt"
if [ -f "$myFile" ]; then
    echo 123
fi

# vagrant 启动后，启动docker服务
sudo docker compose -f /vagrant/docker/docker-compose.yml up -d
