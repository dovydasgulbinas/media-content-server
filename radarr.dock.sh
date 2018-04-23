#!/bin/bash
#https://hub.docker.com/r/linuxserver/ranarr/

source media-user.sh

# container specific params

cname='radarr'
port=7878
cdir="$homedir/$cname-config"
ddir="/media/raid/media/downloads"
mdir="/media/raid/media/movies"

sudo su - $uname -c "mkdir -p $cdir"
sudo su - $uname -c "mkdir -p $ddir"
sudo su - $uname -c "mkdir -p $mdir"


# remove container with same name if present
docker stop $cname
docker rm $cname

docker run --name=$cname \
-v $cdir:/config \
-v /etc/localtime:/etc/localtime:ro \
-v $mdir:/movies \
-v $ddir:/downloads \
-e TZ="Europe/Vilnius" \
-e PUID=$uid -e PGID=$gid \
-p $port:7878 \
-it linuxserver/radarr

docker start $cname
docker ps
