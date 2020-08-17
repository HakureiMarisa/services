FROM docker_ubuntu

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install -y software-properties-common git \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get update

RUN apt-get install -y php7.2-dev php7.2-cli php7.2-fpm php7.2-mysql php7.2-curl php7.2-json php7.2-mbstring php7.2-xml php7.2-intl php7.2-gd php7.2-gmp

RUN pecl install apcu && echo "extension = apcu.so" | tee -a /etc/php/7.2/mods-available/apcu.ini \
    && phpenmod apcu

RUN pecl install redis && echo "extension = redis.so" | tee -a /etc/php/7.2/mods-available/redis.ini \
    && phpenmod redis

RUN mkdir /var/run/php/

USER www-data:www-data
