#!/bin/bash

#https://hub.docker.com/r/linuxserver/sonarr/

source media-user.sh

# container specific params

cname='lidarr' 
port=8686
cdir="$homedir/$cname-config"
ddir="/media/raid/media/downloads"
sdir="/media/raid/media/lidarr-music"

sudo su - $uname -c "mkdir -p $cdir"
sudo su - $uname -c "mkdir -p $ddir"

# remove container with same name if present
docker stop $cname
docker rm $cname

docker run --name=$cname \
-p $port:8686 \
-e PUID=$uid -e PGID=$gid \
-v $cdir:/config \
-v $sdir:/music \
-v $ddir:/downloads \
-it linuxserver/lidarr

docker start $cname
docker ps
