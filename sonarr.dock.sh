#!/bin/bash

#https://hub.docker.com/r/linuxserver/sonarr/

uname='sonarr'
homedir="/opt/$uname"
uid=5002
gid=5000
cname=$uname  # docker container name


if getent passwd $uname > /dev/null 2>&1; then
    echo "User '$uname' already exists"
else
    echo "User '$uname' does not exist we will create directories"
		sudo mkdir $homedir
		sudo chown $uid:$gid $homedir
		sudo useradd -u $uid -g $gid $uname --home-dir $homedir
fi

# container specific params
cdir="$homedir/config"
sdir="/media/raid/media/series"
ddir='/media/raid/media/downloads'

sudo su - $uname -c "mkdir -p $cdir"


# remove container with same name if present
docker stop $cname
docker rm $cname

docker create --name=$uname \
-p 8989:8989 \
-e PUID=$uid -e PGID=$gid \
-e TZ="Europe/Vilnius" \
-v /etc/localtime:/etc/localtime:ro \
-v $cdir:/config \
-v $sdir:/tv \
-v $ddir:/downloads \
-it linuxserver/sonarr

docker start $cname
docker ps
