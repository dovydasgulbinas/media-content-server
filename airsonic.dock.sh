#!/bin/bash

# https://hub.docker.com/r/linuxserver/airsonic/

source media-user.sh

# container specific params

SHARES_BASE="/media/raid/media"

cname='airsonic' 
port=4040

cdir="$homedir/$cname-config"
musicdir="$SHARES_BASE/music"
podcastdir="$SHARES_BASE/podcasts"
playlistdir="$SHARES_BASE/playlists"
mediadir="$SHARES_BASE/youtube-videos"

sudo su - $uname -c "mkdir -p $cdir"
sudo su - $uname -c "mkdir -p $musicdir"
sudo su - $uname -c "mkdir -p $podcastdir"
sudo su - $uname -c "mkdir -p $playlistdir"
sudo su - $uname -c "mkdir -p $mediadir"

# remove container with same name if present
docker stop $cname
docker rm $cname

docker run --name=$cname \
-p $port:4040 \
-e PUID=$uid -e PGID=$gid \
-e TZ=$tz \
-v $cdir:/config \
-v $musicdir:/music \
-v $podcastdir:/podcasts \
-v $playlistdir:/playlists \
-v $mediadir:/media \
-it linuxserver/airsonic

docker start $cname
docker ps
