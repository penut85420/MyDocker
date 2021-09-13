#!/bin/bash

export ROOT_PASSWD=4U5FrMaRKeY4vvjXJZzzZ82X7n7HCGtz
export PASSWD=WGzWCrtx3xM9pTWC7S7ptBbpx7UNDCZS
export CERT_PATH=/home/oppai/Documents/Docker/nginx-certbot/data/certbot/

docker run -it --name dj-mariadb --rm \
    -e MYSQL_ROOT_PASSWORD=$ROOT_PASSWD \
    -e MYSQL_USER=domjudge \
    -e MYSQL_PASSWORD=$PASSWD \
    -e MYSQL_DATABASE=domjudge \
    -p 13306:3306 \
    mariadb --max-connections=1000

docker run --link dj-mariadb:mariadb -it --rm \
    -e CONTAINER_TIMEZONE=Asia/Taipei \
    -e MYSQL_HOST=mariadb \
    -e MYSQL_USER=domjudge \
    -e MYSQL_DATABASE=domjudge \
    -e MYSQL_PASSWORD=$PASSWD \
    -e MYSQL_ROOT_PASSWORD=$ROOT_PASSWD \
    -v $CERT_PATH:/cert \
    -p 12345:443 \
    --name domserver \
    domjudge/domserver:7.3.0
