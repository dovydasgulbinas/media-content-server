#!/bin/bash

# https://hub.docker.com/r/linuxserver/calibre-web/

source world-user.sh

# container specific params

cname='nginx'
cdir="$homedir/$cname-config"
phttp=80
phttps=443


sudo su - $uname -c "mkdir -p $cdir"

# remove container with same name if present
docker stop $cname
docker rm $cname

docker run \
  --name=$cname \
  -v $cdir:/config \
  -e PGID=$gid -e PUID=$uid  \
  -p $phttp:80 -p $phttps:443 \
  -e TZ=$tz \
  linuxserver/nginx

docker start $cname
docker ps
