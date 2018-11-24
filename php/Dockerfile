FROM php:7.2-fpm

# 设置下载代理
RUN pear config-set http_proxy "http://10.0.2.2:1087" \
    # 安装扩展
    && pecl install xdebug-2.6.0 \
    && docker-php-ext-enable xdebug

RUN pecl install swoole-4.2.1 \
    && docker-php-ext-enable swoole


RUN docker-php-ext-install mysqli pdo pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer