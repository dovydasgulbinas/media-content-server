#!/bin/bash

#https://hub.docker.com/r/linuxserver/sonarr/

source media-user.sh

# container specific params

cname='sonarr' 
port=8989
cdir="$homedir/$cname-config"
ddir="/media/raid/media/downloads"
sdir="/media/raid/media/series"

sudo su - $uname -c "mkdir -p $cdir"
sudo su - $uname -c "mkdir -p $ddir"

# remove container with same name if present
docker stop $cname
docker rm $cname

docker run --name=$cname \
-p $port:8989 \
-e PUID=$uid -e PGID=$gid \
-e TZ="Europe/Vilnius" \
-v /etc/localtime:/etc/localtime:ro \
-v $cdir:/config \
-v $sdir:/tv \
-v $ddir:/downloads \
-it linuxserver/sonarr

docker start $cname
docker ps
