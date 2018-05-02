#!/bin/bash

# https://hub.docker.com/_/mariadb/

source world-user.sh

# container specific params

cname='mariadb'
cdir="$homedir/$cname-config"
dbname='hass'
dbuser='hermes'
dbport=3306
secdir="/opt/world/secrets/"


sudo su - $uname -c "mkdir -p $cdir"

# remove container with same name if present
docker stop $cname
docker rm $cname

docker run \
  --name=$cname \
  -v $cdir:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD_FILE="$secdir/MYSQL_ROOT_PASSWORD_FILE" \
  -e MYSQL_PASSWORD_FILE="$secdir/MYSQL_PASSWORD_FILE" \
  -e MYSQL_USER=$dbuser \
  -e MYSQL_DATABASE=$dbname \
  -p $dbport:3306 \
  mariadb:latest

docker start $cname
docker ps
