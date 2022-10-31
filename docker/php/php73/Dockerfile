FROM docker_ubuntu

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install -y software-properties-common git \
    && add-apt-repository -y ppa:ondrej/php \
    && sed -i 's/http:\/\/ppa.launchpad.net/https:\/\/launchpad.proxy.ustclug.org/g' /etc/apt/sources.list /etc/apt/sources.list.d/*.list \
    && apt-get update

RUN apt-get update && apt install -y vim zip curl wget

RUN apt-get update \
    && apt-get install -y php7.3-dev php7.3-cli php7.3-fpm \
        php7.3-mysql php7.3-curl php7.3-json php7.3-mbstring php7.3-xml php7.3-intl \
        php7.3-gd php7.3-gmp php7.3-curl php7.3-zip php7.3-soap php7.3-bz2 php7.3-bcmath \
        php7.3-redis php7.3-apcu \
        php7.3-amqp php7.3-mongodb

RUN apt autoclean && apt autoremove

RUN userdel -r www-data \
    && groupadd -r -g 1000 www-data && useradd -r -g www-data -u 1000 www-data
RUN mkdir /var/run/php/ && mkdir -p /usr/share/www/ && chown www-data:www-data /usr/share/www/
#USER www-data:www-data

COPY ./entrypoint.sh /

ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["php-fpm7.3", "-F"]
