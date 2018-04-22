#!/bin/bash

# https://hub.docker.com/r/jaysonsantos/minecraft-ftb-skyfactory3/

cname='minecraft-sf3'  # docker container name
port=25565
cdir="$homedir/minecraft-sf3"
volname="$cname-vol"
# uname='fun'
# homedir="/opt/fun"
# uid=5100
# gid=$uid


# if getent passwd $uname > /dev/null 2>&1; then
#     echo "User '$uname' already exists"
# else
#     echo "User '$uname' does not exist we will create directories"
# 		sudo mkdir $homedir
# 		sudo chown $uid:$gid $homedir
# 		sudo useradd -u $uid --home-dir $homedir $uname
# fi


# Create Config Dir
# sudo su - $uname -c "mkdir -p $cdir"
docker volume create $volname


# remove container with same name if present
docker stop $cname
docker rm $cname

docker run \
--name=$cname \
--mount source=$volname,destination=/data \
-p $port:25565 \
-e 'MOTD=Komanda-X SkyFactory3' \
jaysonsantos/minecraft-ftb-skyfactory3

docker start $cname

#-e 'JVM_OPTS=-Xmx1024M -Xms1024' \
