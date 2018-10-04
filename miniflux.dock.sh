#!/bin/bash

# https://hub.docker.com/r/linuxserver/calibre-web/

source media-user.sh

# container specific params

cname='miniflux'
cdir="$homedir/$cname-config"
cdir=""
port=8777

#sudo su - $uname -c "mkdir -p $cdir"

# remove container with same name if present
docker stop $cname
docker rm $cname



docker run -d \
    -p $port:8080 \
    miniflux/miniflux:2.0.11


docker start $cname
docker ps
