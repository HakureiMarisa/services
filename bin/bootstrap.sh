
ll

myFile="./install.txt"
if [ -f "$myFile" ]; then
    echo 123
fi

# vagrant ����������docker����
sudo docker compose -f /vagrant/docker/docker-compose.yml up -d
