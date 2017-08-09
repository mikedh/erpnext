#!/bin/bash
apt-get update && apt-get install -y wget ca-certificates sudo cron supervisor python-minimal build-essential python-setuptools apt-utils

cd /tmp
wget https://raw.githubusercontent.com/frappe/bench/master/playbooks/install.py

# generate random 32 charecter alphanumeric passwords for admin and sql
PW_SQL=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
PW_ADM=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

python install.py --production --user frappe --mysql-root-password $PW_SQL --admin-password $PW_ADM

#bench setup supervisor sudo ln -s `pwd`/config/supervisor.conf /etc/supervisor/conf.d/frappe-bench.conf
#bench setup nginx sudo ln -s `pwd`/config/nginx.conf /etc/nginx/conf.d/frappe-bench.conf

#bench setup production

apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
