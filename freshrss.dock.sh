#!/bin/bash

# https://hub.docker.com/r/linuxserver/calibre-web/

source media-user.sh

# container specific params

cname='freshrss'
cdir="$homedir/$cname-config"
port=8619


sudo su - $uname -c "mkdir -p $cdir"

# remove container with same name if present
docker stop $cname
docker rm $cname

docker run \
    --name=$cname \
    -v $cdir:/config \
    -e PGID=$gid -e PUID=$uid \
    -p $port:80 \
    linuxserver/freshrss

docker start $cname
docker ps
