#!/bin/sh
set -e

crontab /etc/cron.d/crontab && /etc/init.d/cron start && /usr/bin/supervisord -n
