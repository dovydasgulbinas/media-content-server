#!/bin/bash

# https://hub.docker.com/r/linuxserver/jackett/

uname='jackett'
homedir="/opt/$uname"
uid=5004
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
ddir='/media/raid/media/downloads'

sudo su - $uname -c "mkdir -p $cdir"


# remove container with same name if present
docker stop $cname
docker rm $cname

docker create \
--name=$cname \
-v $cdir:/config \
-v $ddir:/downloads \
-e PGID=$gid -e PUID=$uid  \
-e TZ='Europe/Vilnius' \
-v /etc/localtime:/etc/localtime:ro \
-p 9117:9117 \
linuxserver/jackett

docker start $cname
