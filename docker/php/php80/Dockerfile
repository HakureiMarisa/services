FROM docker_ubuntu

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

#composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

RUN apt-get update && apt-get install -y software-properties-common git \
    && add-apt-repository -y ppa:ondrej/php \
    && sed -i 's/http:\/\/ppa.launchpad.net/https:\/\/launchpad.proxy.ustclug.org/g' /etc/apt/sources.list /etc/apt/sources.list.d/*.list \
    && apt-get update

RUN apt-get update && apt install -y vim zip curl wget

RUN apt-get update \
    && apt-get install -y php8.0-dev php8.0-cli php8.0-fpm \
        php8.0-mysql php8.0-curl php8.0-mbstring php8.0-xml php8.0-intl \
        php8.0-gd php8.0-gmp php8.0-curl php8.0-zip php8.0-soap php8.0-bz2 php8.0-bcmath \
        php8.0-redis php8.0-apcu \
        php8.0-amqp php8.0-mongodb

RUN apt autoclean && apt autoremove

RUN userdel -r www-data \
    && groupadd -r -g 1000 www-data && useradd -r -g www-data -u 1000 www-data
RUN mkdir /var/run/php/ && mkdir -p /usr/share/www/ && chown www-data:www-data /usr/share/www/
#USER www-data:www-data

COPY ./entrypoint.sh /

ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["php-fpm8.0", "-F"]
