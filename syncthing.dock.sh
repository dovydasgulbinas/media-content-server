#!/bin/bash

#https://hub.docker.com/r/linuxserver/sonarr/

source media-user.sh

# container specific params

SHARES_BASE="/media/raid/media/sync-shares"

cname='syncthing' 
port=8384
mask='022'


cdir="$homedir/$cname-config"
syncdir="$SHARES_BASE/Sync"
tabletdir="$SHARES_BASE/tablet"

sudo su - $uname -c "mkdir -p $cdir"
sudo su - $uname -c "mkdir -p $syncdir"
sudo su - $uname -c "mkdir -p $tabletdir"


# remove container with same name if present
docker stop $cname
docker rm $cname

docker run --name=$cname \
-p $port:8384 \
-p 22000:22000 \
-p 21027:21027/udp \
-e PUID=$uid -e PGID=$gid \
-e UMASK_SET=$mask \
-v $cdir:/config \
-v $syncdir:/Sync \
-v $tabletdir:/tablet \
-it linuxserver/syncthing

docker start $cname
docker ps
