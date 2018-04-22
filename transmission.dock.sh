#!/bin/bash

#https://hub.docker.com/r/linuxserver/transmission/

source media-user.sh

# container specific params

cname='transmission' 
cdir="$homedir/$cname-config"
ddir='/media/raid/media/downloads'
wdir="$ddir"

sudo su - $uname -c "mkdir -p $cdir"
sudo su - $uname -c "mkdir -p $wdir"

# remove container with same name if present
docker stop $cname
docker rm $cname

docker run --name=$cname \
-v $cdir:/config \
-v $ddir:/downloads \
-v $wdir:/watch \
-e PGID=$gid -e PUID=$uid \
-e TZ='Europe/Vilnius' \
-p 9091:9091 -p 51413:51413 \
-p 51413:51413/udp \
linuxserver/transmission

docker start $cname
docker ps 
