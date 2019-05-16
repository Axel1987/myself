#!/bin/sh
set -e

php-fpm -D \
    && crontab /etc/cron.d/crontab \
    && /etc/init.d/cron start \
    && /usr/bin/supervisord -n
