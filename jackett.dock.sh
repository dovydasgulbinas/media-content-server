#!/bin/bash

# chmod before run
#chmod 774 jackett.dock.sh

# https://hub.docker.com/r/linuxserver/jackett/


# uncoment if you want a user created
#sudo useradd -u 2000 jackett


docker volume create jackett-conf-vol
docker volume create jackett-tmp-vol
docker volume ls

docker volume inspect jackett-conf-vol 
docker volume inspect jackett-tmp-vol 


docker create \
--name=jackett \
-v jackett-conf-vol:/config \
-v jackett-tmp-vol:/downloads \
-e PGID=2000 -e PUID=2000  \
-e TZ='Europe/Vilnius' \
-v /etc/localtime:/etc/localtime:ro \
-p 9117:9117 \
linuxserver/jackett

docker start jackett
