#!/bin/bash

#https://hub.docker.com/r/linuxserver/transmission/

# uncoment if you want a user created
#sudo useradd -u 1999 transmission

docker volume create apache-conf-vol
docker volume inspect apache-conf-vol

# remove container with same name if present
docker stop apache
docker rm apache

docker create \
--name="apache" \
-p 80:80 -p 443:443 \
-v apache-conf-vol:/config \
linuxserver/apache

docker start apache
docker ps 
