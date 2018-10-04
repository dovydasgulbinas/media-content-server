#!/bin/bash

#https://hub.docker.com/r/linuxserver/sonarr/

source media-user.sh

# container specific params

MEDIA_BASE="/media/raid/media"
SHARES_BASE="$MEDIA_BASE/sync-shares"

cname='syncthing' 
port=8384
mask='022'


cdir="$homedir/$cname-config"
syncdir="$SHARES_BASE/Sync"
tabletdir="$SHARES_BASE/tablet"
phonedir="$SHARES_BASE/Phone"
calibredir="$SHARES_BASE/Books"
audiobooks="$SHARES_BASE/AudioBooks"
projects="$SHARES_BASE/Projects"
musicdir="$MEDIA_BASE/beets-music"
# musicdir="$SHARES_BASE/Calibre"  # Mount different than $SHARES_BASE

sudo su - $uname -c "mkdir -p $cdir"
sudo su - $uname -c "mkdir -p $syncdir"
sudo su - $uname -c "mkdir -p $tabletdir"
sudo su - $uname -c "mkdir -p $phonedir"
sudo su - $uname -c "mkdir -p $calibredir"
sudo su - $uname -c "mkdir -p $audiobooks"
sudo su - $uname -c "mkdir -p $projects"
sudo su - $uname -c "mkdir -p $musicdir"


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
-v $phonedir:/Phone \
-v $calibredir:/Books \
-v $audiobooks:/AudioBooks \
-v $projects:/Projects \
-v $musicdir:/Music \
-it linuxserver/syncthing

docker start $cname
docker ps
