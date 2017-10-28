#!/bin/bash

#https://hub.docker.com/r/linuxserver/transmission/

# uncoment if you want a user created
sudo useradd -u 8081 medusa

docker volume create medusa-conf-vol
docker volume create tv-medusa-vol

docker volume ls
docker volume inspect medusa-conf-vol
docker volume inspect tv-medusa-vol
docker volume inspect transmission-downloads-vol

# remove container with same name if present
docker stop medusa
docker rm medusa

docker create --name=medusa \
-v medusa-conf-log:/config \
-v transmission-downloads-vol:/downloads \
-v tv-medusa-vol:/tv \
-e PGID=8081 -e PUID=8081  \
-e TZ="Europe/Vilnius" \
-p 8081:8081 \
-it linuxserver/medusa

docker start medusa
docker ps 
