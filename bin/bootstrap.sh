
ls -al

myFile="./install.txt"
if [ -f "$myFile" ]; then
    . ubuntu.sh
    . docker.sh
fi


cd /vagrant/services/docker/
sudo docker-compose up -d

