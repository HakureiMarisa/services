#!/bin/bash

composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

exec "$@"
