#!/bin/bash

# https://hub.docker.com/r/linuxserver/jackett/

source media-user.sh

# container specific params

cname='jackett' 
cdir="$homedir/$cname-config"
ddir="/media/raid/media/downloads/$cname-dl"

sudo su - $uname -c "mkdir -p $cdir"
sudo su - $uname -c "mkdir -p $ddir"

# remove container with same name if present
docker stop $cname
docker rm $cname

docker run \
--name=$cname \
-v $cdir:/config \
-v $ddir:/downloads \
-e PGID=$gid -e PUID=$uid  \
-e TZ='Europe/Vilnius' \
-v /etc/localtime:/etc/localtime:ro \
-p 9117:9117 \
linuxserver/jackett

docker start $cname
docker ps
