#!/bin/bash

#https://hub.docker.com/r/linuxserver/transmission/

# uncoment if you want a user created
#sudo useradd -u 5001 transmission

uname='transmission'
homedir="/opt/$uname"
uid=5001
gid=5000
cname=$uname  # docker container name

sudo useradd -u $uid $uname --home-dir $homedir

# container specific params
cdir="$homedir/config"
ddir='/media/raid/media/downloads'
wdir="$ddir/watch"

sudo su - $uname -c "mkdir -p $cdir"
sudo su - $uname -c "mkdir -p $wdir"


# remove container with same name if present
docker stop $cname
docker rm $cname

docker create --name=$cname \
-v $cdir:/config \
-v $ddir:/downloads \
-v $wdir:/watch \
-e PGID=$gid -e PUID=$uid \
-e TZ='Europe/Vilnius' \
-p 9091:9091 -p 51413:51413 \
-p 51413:51413/udp \
linuxserver/transmission

docker start $cname
docker ps 
