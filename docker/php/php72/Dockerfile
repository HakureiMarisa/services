FROM docker_ubuntu

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install -y software-properties-common git \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get update

RUN apt-get update && apt install -y vim zip curl wget

RUN apt-get update \
    && sed -i 's/ppa.launchpad.net/launchpad.proxy.ustclug.org/g' /etc/apt/sources.list /etc/apt/sources.list.d/*.list \
    && apt-get install -y php7.2-dev php7.2-cli php7.2-fpm \
        php7.2-mysql php7.2-curl php7.2-json php7.2-mbstring php7.2-xml php7.2-intl \
        php7.2-gd php7.2-gmp php7.2-curl php7.2-zip php7.2-soap php7.2-bz2 php7.2-bcmath \
        php7.2-redis php7.2-apcu

# RUN wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.12/gosu-amd64" \
#     && chmod +x /usr/local/bin/gosu \
#     && gosu nobody true

RUN apt autoclean && apt autoremove

RUN userdel -r www-data \
    && groupadd -r -g 1000 www-data && useradd -r -g www-data -u 1000 www-data
RUN mkdir /var/run/php/ && mkdir -p /usr/share/www/ && chown www-data:www-data /usr/share/www/
#USER www-data:www-data

COPY ./entrypoint.sh /

ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["php-fpm7.2", "-F"]
