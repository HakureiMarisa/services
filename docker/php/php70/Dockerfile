FROM ubuntu
RUN sed -i '/jessie-updates/d' /etc/apt/sources.list  # Now archived
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install -y \
    libgmp-dev  \
    libfreetype6-dev \
    libmcrypt-dev \
    libpng12-dev \
    libjpeg-dev \
    libpng-dev \
    libxml2-dev \
    librabbitmq-dev \
    libssh-dev \
    libbz2-dev \
    librabbitmq-dev \
    libfreetype6-dev \
    libxpm-dev \
    libpng-dev \
    python-minimal \
    libmemcached-dev \
    libmcrypt-dev \
    unzip \
    libpcre3 \
    libpcre3-dev \
    libssh2-1-dev \
    libcurl4-openssl-dev \
    libtidy-dev \
    && ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/local/include/ \
    && docker-php-ext-configure gmp \
    && pecl install amqp-1.7.1 apcu \
    && docker-php-ext-enable amqp apcu \
    && docker-php-ext-install gmp mysqli pdo pdo_mysql pcntl calendar shmop sysvmsg sysvsem wddx bcmath sockets zip exif soap \
    && pecl install amqp-1.7.1 apcu \
    && docker-php-ext-enable amqp apcu \
    && docker-php-ext-install gettext bz2 \
    && docker-php-ext-configure gd --with-freetype-dir --with-jpeg-dir --with-xpm-dir \
    && docker-php-ext-install gd

RUN cd /tmp \
    && curl -O -L https://github.com/edenhill/librdkafka/archive/v0.9.2.tar.gz \
    && tar xzvf v0.9.2.tar.gz \
    && cd /tmp/librdkafka-0.9.2 \
    && ./configure && make && make install \
    && rm -rf /tmp/librdkafka-0.9.2 v0.9.2.tar.gz

RUN set -x \
    && cd /tmp \
    && curl -sSL -o php7.zip https://github.com/websupport-sk/pecl-memcache/archive/php7.zip \
    && unzip php7 \
    && cd pecl-memcache-php7 \
    && /usr/local/bin/phpize \
    && ./configure --with-php-config=/usr/local/bin/php-config \
    && make \
    && make install \
    && echo "extension=memcache.so" > /usr/local/etc/php/conf.d/ext-memcache.ini \
    && rm -rf /tmp/pecl-memcache-php7 php7.zip

ENV THRIFT_VERSION 0.10.0
RUN buildDeps=" \
		automake \
		bison \
		curl \
		flex \
		g++ \
		libboost-dev \
		libboost-filesystem-dev \
		libboost-program-options-dev \
		libboost-system-dev \
		libboost-test-dev \
		libevent-dev \
		libssl-dev \
		libtool \
		make \
		pkg-config \
	"; \
	apt-get install -y --no-install-recommends $buildDeps && rm -rf /var/lib/apt/lists/* \
	&& curl -k -sSL "https://github.com/apache/thrift/archive/${THRIFT_VERSION}.tar.gz" -o thrift.tar.gz \
	&& mkdir -p /usr/src/thrift \
	&& tar zxf thrift.tar.gz -C /usr/src/thrift --strip-components=1 \
	&& rm thrift.tar.gz \
	&& cd /usr/src/thrift \
	&& ./bootstrap.sh \
	&& ./configure --disable-libs \
	&& make \
	&& make install \
	&& cd /usr/src/thrift/lib/php/src/ext/thrift_protocol \
    && /usr/local/bin/phpize \
    && ./configure --with-php-config=/usr/local/bin/php-config --enable-thrift_protocol \
    && make && make install \
	&& cd / \
	&& rm -rf /usr/src/thrift

RUN docker-php-ext-enable thrift_protocol

COPY --from=zookeeper:3.4.13 /zookeeper-3.4.13/ /zookeeper-3.4.13/

RUN apt-get update && apt-get install -y --no-install-recommends libxslt-dev libzmq-dev libzookeeper-mt-dev \
    && pecl install yac-2.0.2 \
    && pecl install yaf-3.0.4 \
    && pecl install zookeeper-0.6.3 \
    && docker-php-ext-install xsl \
    && docker-php-ext-enable yac yaf zookeeper \
    && pecl install msgpack-2.0.3 \
    && pecl install memcached \
    && pecl install protobuf \
    && pecl install rdkafka \
    && pecl install redis-3.0.0 \
    && docker-php-ext-enable msgpack memcached protobuf redis rdkafka \
    && docker-php-ext-install mcrypt \
    && pecl install solr-2.4.0 \
    && pecl install ssh2-1.0 \
    && docker-php-ext-enable solr ssh2 \
    && pecl install swoole \
    && docker-php-ext-install tidy \
    && docker-php-ext-enable swoole

RUN apt-get update && apt-get install -y git

RUN set -x \
    && cd /tmp \
    && curl -sSL -o php-memcache.tar.xz http://deb.debian.org/debian/pool/main/p/php-memcache/php-memcache_3.0.9~20170802.e702b5f.orig.tar.xz \
    && mkdir -p /tmp/php-memcache \
    && tar xvJf php-memcache.tar.xz -C /tmp/php-memcache --strip-components=1 \
    && cd /tmp/php-memcache \
    && phpize && ./configure \
    && make \
    && make install \
    && echo "extension=memcache.so" > /usr/local/etc/php/conf.d/ext-memcache.ini \
    && rm -rf /tmp/php-memcache php-memcache.tar.xz

RUN apt-get install -y --no-install-recommends wget \
    && wget https://github.com/zeromq/libzmq/releases/download/v4.3.1/zeromq-4.3.1.tar.gz \
    && tar -xvzf zeromq-4.3.1.tar.gz \
    && cd zeromq-4.3.1 \
    && ./configure \
    && make \
    && make install \
    && ldconfig \
    && pecl install zmq-beta \
    && docker-php-ext-enable zmq

COPY lib/Wmb_php_consumer_v0.2.5.zip /tmp/Wmb_php_consumer_v0.2.5.zip

RUN cd /tmp \
    && unzip Wmb_php_consumer_v0.2.5.zip \
    && cd wmb_php_consumer_v0.2.5 \
    && cd wmb_client_c_v2/ \
    && make && make install \
    && cd ../ \
    && cd wmb_client_php_v2/ \
    && phpize && ./configure \
    && make && make install \
    && echo "extension=esb_client.so" > /usr/local/etc/php/conf.d/ext-esb_client.ini \
    && rm -rf /tmp/wmb_php_consumer_v0.2.5 Wmb_php_consumer_v0.2.5.zip

#RUN pecl install xdebug \
#    && docker-php-ext-enable xdebug

RUN apt-get install -y --no-install-recommends tzdata rsyslog
ENV TZ Asia/Shanghai

RUN apt-get purge -y --auto-remove $buildDeps \
	&& rm -rf /var/cache/apt/* \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /tmp/* \
	&& rm -rf /var/tmp/*

RUN mkdir -p /data1/logs/v2 && chmod -R 777 /data1

RUN usermod -u 1000 www-data \
    && groupmod -g 1000 www-data \
    && chown www-data:www-data /usr/bin/composer \
    && chown -R www-data:www-data /var/www/

USER www-data:www-data