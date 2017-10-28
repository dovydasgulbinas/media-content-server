#!/bin/bash

#https://hub.docker.com/r/linuxserver/sonarr/


# uncoment if you want a user created
# sudo useradd -u 2001 sonarr


#docker volume create sonarr-conf-vol
#docker volume create tv-series-vol

docker volume ls
docker volume inspect sonarr-conf-vol 
docker volume inspect tv-series-vol 
# created with transmission installation
docker volume inspect transmission-downloads-vol 

# remove container with same name if present
docker stop sonarr
docker rm sonarr

docker create --name=sonarr \
-p 8989:8989 \
-e PUID=2001 -e PGID=1999 \
-e TZ="Europe/Vilnius" \
-v /etc/localtime:/etc/localtime:ro \
-v sonarr-conf-vol:/config \
-v tv-series-vol:/tv \
-v transmission-downloads-vol:/downloads \
-it linuxserver/sonarr

docker start sonarr
docker ps
