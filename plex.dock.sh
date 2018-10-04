#!/bin/bash
#https://hub.docker.com/r/linuxserver/ranarr/

source media-user.sh

# container specific params

cname='plex'
cdir="$homedir/$cname-config"
mdir="/media/raid/media/movies"
sdir="/media/raid/media/series"
mudir="/media/raid/media/beets-music"
ytdir="/media/raid/media/youtube-videos"


sudo su - $uname -c "mkdir -p $cdir"
sudo su - $uname -c "mkdir -p $mdir"
sudo su - $uname -c "mkdir -p $sdir"
sudo su - $uname -c "mkdir -p $mudir"
sudo su - $uname -c "mkdir -p $ytdir"


# remove container with same name if present
docker stop $cname
docker rm $cname


docker run \
  --name=$cname \
  --net=host \
  -e VERSION=latest \
  -e PUID=$uid -e PGID=$gid \
  -e TZ=$tz \
  -v $cdir:/config \
  -v $sdir:/data/tvshows \
  -v $mdir:/data/movies \
  -v $mudir:/data/music \
  -v $ytdir:/data/youtube \
  linuxserver/plex



docker start $cname
docker ps
