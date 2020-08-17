FROM php:7.2-fpm

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 设置下载代理
RUN pecl install xdebug-2.6.0 \
    && docker-php-ext-enable xdebug

RUN pecl install swoole-4.2.1 \
    && docker-php-ext-enable swoole

RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN pecl install redis \
    && docker-php-ext-enable redis

USER www-data:www-data
