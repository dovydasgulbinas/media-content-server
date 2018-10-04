#!/bin/bash
#https://hub.docker.com/r/linuxserver/ranarr/

source media-user.sh

# container specific params

cname='nextcloud'
cdir="$homedir/$cname-config"
ddir="$MEDIA_NEXTCLOUD_ROOT"
port=8143


sudo su - $uname -c "mkdir -p $cdir"
sudo su - $uname -c "mkdir -p $ddir"


# remove container with same name if present
docker stop $cname
docker rm $cname


docker run \
  --name=$cname \
  -p $port:443 \
  -e PUID=$uid -e PGID=$gid \
  -v $cdir:/config \
  -v $ddir:/data \
  linuxserver/nextcloud


docker start $cname
docker ps
