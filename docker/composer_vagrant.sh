#!/usr/bin/shell

docker-compose -f /vagrant/docker/docker-compose.yml run php70 /bin/bash -c "sh /usr/share/www/composer.sh ${*}"