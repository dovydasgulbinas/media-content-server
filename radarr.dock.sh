#!/bin/bash

#https://hub.docker.com/r/linuxserver/sonarr/


# uncoment if you want a user created
# sudo useradd -u 2001 sonarr


docker volume create radarr-conf-vol
docker volume create movies-vol

docker volume ls
docker volume inspect radarr-conf-vol 
docker volume inspect movies-vol 
# created with transmission installation
docker volume inspect transmission-downloads-vol 

# remove container with same name if present
docker stop radarr
docker rm radarr

docker create --name=radarr \
-v radarr-conf-vol:/config \
-v /etc/localtime:/etc/localtime:ro \
-v movies-vol:/movies \
-v transmission-downloads-vol:/downloads \
-e TZ="Europe/Vilnius" \
-e PUID=2002 -e PGID=2002 \
-p 7878:7878 \
-it linuxserver/radarr

docker start radarr
docker ps
