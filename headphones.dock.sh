#!/bin/bash

#https://hub.docker.com/r/linuxserver/sonarr/

source media-user.sh

# container specific params

cname='headphones' 
port=8181
cdir="$homedir/$cname-config"
ddir="/media/raid/media/downloads/$cname-dl"
mdir="/media/raid/media/$cname-music"

sudo su - $uname -c "mkdir -p $cdir"
sudo su - $uname -c "mkdir -p $ddir"
sudo su - $uname -c "mkdir -p $mdir"

# remove container with same name if present
docker stop $cname
docker rm $cname

docker run --name=$cname \
-p $port:8181 \
-e PUID=$uid -e PGID=$gid \
-e TZ=$tz \
-v $cdir:/config \
-v $mdir:/music \
-v $ddir:/downloads \
-it linuxserver/headphones

docker start $cname
docker ps
