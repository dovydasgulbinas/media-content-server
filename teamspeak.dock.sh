#!/bin/bash

#https://hub.docker.com/r/linuxserver/transmission/

uname='teamspeak'
homedir="/opt/$uname"
uid=5005
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

sudo su - $uname -c "mkdir -p $cdir"


# remove container with same name if present
docker stop $cname
docker rm $cname

docker create --name=$cname \
--net=host \
-v /etc/localtime:/etc/localtime:ro \
-v $cdir:/config \
-e PGID=$gid -e PUID=$uid \
-p 30033:30033 \
-p 10011:10011 \
-p 41144:41144 \
-p 9987:9987/udp \
linuxserver/gsm-ts3

docker start $cname
docker ps 
