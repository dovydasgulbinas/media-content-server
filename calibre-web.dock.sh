#!/bin/bash

# https://hub.docker.com/r/linuxserver/calibre-web/

source media-user.sh

# container specific params

cname='calibre-web'
cdir="$homedir/$cname-config"
bdir="/media/raid/media/books"
port=8083


sudo su - $uname -c "mkdir -p $cdir"
sudo su - $uname -c "mkdir -p $bdir"

# remove container with same name if present
docker stop $cname
docker rm $cname

docker run \
  --name=$cname \
  -v $cdir:/config \
  -v $bdir:/books \
  -e PGID=$gid -e PUID=$uid  \
  -p $port:8083 \
  linuxserver/calibre-web


docker start $cname
docker ps
