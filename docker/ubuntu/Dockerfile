FROM ubuntu:18.04

COPY ubuntu.sh /usr/bin/

RUN chmod +x /usr/bin/ubuntu.sh && sh /usr/bin/ubuntu.sh

ENV TZ 'Asia/Shanghai'

RUN echo $TZ > /etc/timezone \
    && apt-get update && apt-get install -y tzdata language-pack-en-base \
    && rm /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && locale-gen en_US.UTF-8

ENV LC_ALL en_US.UTF-8

RUN apt-get install -y vim rsyslog wget zip curl