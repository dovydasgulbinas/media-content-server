#!/bin/bash

#https://hub.docker.com/r/linuxserver/sonarr/

uname='radarr'
homedir="/opt/$uname"
uid=5003
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
mdir="/media/raid/media/movies"
ddir='/media/raid/media/downloads'

sudo su - $uname -c "mkdir -p $cdir"


# remove container with same name if present
docker stop $cname
docker rm $cname

docker create --name=$cname \
-v $cdir:/config \
-v /etc/localtime:/etc/localtime:ro \
-v $mdir:/movies \
-v $ddir:/downloads \
-e TZ="Europe/Vilnius" \
-e PUID=$uid -e PGID=$gid \
-p 7878:7878 \
-it linuxserver/radarr

docker start $cname
docker ps
