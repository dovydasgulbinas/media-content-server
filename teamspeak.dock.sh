#!/bin/bash

#https://hub.docker.com/r/linuxserver/transmission/

# uncoment if you want a user created
sudo useradd -u 2111 teamspeak

docker volume create teamspeak-conf-vol

docker volume inspect teamspeak-conf-vol

# remove container with same name if present
docker stop teamspeak
docker rm teamspeak

docker create --name=teamspeak \
--net=host \
-v /etc/localtime:/etc/localtime:ro \
-v teamspeak-conf-vol:/config \
-e PGID=2111 -e PUID=2111 \
linuxserver/gsm-ts3

docker start teamspeak
docker ps 
