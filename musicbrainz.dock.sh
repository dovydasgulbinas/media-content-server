#!/bin/bash

#https://hub.docker.com/r/linuxserver/sonarr/

source media-user.sh

# container specific params

cname='musicbr' 
port=5000
cdir="$homedir/$cname-config"
ddir="/media/raid/media/ytdl-music"

sudo su - $uname -c "mkdir -p $cdir"
sudo su - $uname -c "mkdir -p $ddir"

# remove container with same name if present
docker stop $cname
docker rm $cname

docker run --name=$cname \
-p $port:5000 \
-e PUID=$uid -e PGID=$gid \
-v $cdir:/config \
-v $ddir:/data \
-e WEBADDRESS=$ip \
-e BRAINZCODE='alsyQQFVLsQznyxRnOINFWAkmxTwlZqBv5m0eRNr' \
-e TZ=$tz linuxserver/musicbrainz

docker start $cname
docker ps
