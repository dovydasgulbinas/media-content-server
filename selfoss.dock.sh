#!/bin/bash

# https://hub.docker.com/r/linuxserver/calibre-web/

source media-user.sh

# container specific params

cname='selfoss'
cdir="$homedir/$cname-config"
cdir=""
port=8666
ddir="$MEDIA_DATA_ROOT/rss/selfoss"

sudo su - $uname -c "mkdir -p $cdir"
sudo su - $uname -c "mkdir -p $ddir"

# remove container with same name if present
docker stop $cname
docker rm $cname


docker run -d \
    --name $cname \
    --publish $port:80 \
    jenserat/selfoss
#    --volume $ddir:/var/www/html/data \


docker start $cname
docker ps
