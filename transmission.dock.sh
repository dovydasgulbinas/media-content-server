#!/bin/bash

#https://hub.docker.com/r/linuxserver/transmission/

# uncoment if you want a user created
#sudo useradd -u 1999 transmission

docker volume create transmission-conf-vol
docker volume create transmission-downloads-vol
docker volume create transmission-watch-vol

docker volume ls
docker volume inspect transmission-conf-vol
docker volume inspect transmission-downloads-vol
docker volume inspect transmission-watch-vol

# remove container with same name if present
docker stop transmission
docker rm transmission

docker create --name=transmission \
-v transmission-conf-vol:/config \
-v transmission-downloads-vol:/downloads \
-v transmission-watch-vol:/watch \
-e PGID=1999 -e PUID=1999 \
-e TZ='Europe/Vilnius' \
-p 9091:9091 -p 51413:51413 \
-p 51413:51413/udp \
linuxserver/transmission

docker start transmission
docker ps 
