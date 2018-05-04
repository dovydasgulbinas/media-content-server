#!/bin/bash

# https://github.com/kevin-anidjar/csgo-5on5-pug-dedicated-server

cname="csgo"
conf_path="$HOME/diy/docker/csgo"
lgsmdir="$conf_path/lgsm-confs"  # place where you store confs on local machine
mkdir -p $lgsmdir 

# remove container with same name if present
docker stop $cname
docker rm $cname

docker run --name=$cname \
  -p 27015:27015/udp \
  -p 27015:27015/tcp \
  -p 27005:27005/udp \
  -p 27005:27005/tcp \
  -v $lgsmdir:/home/csgoserver/lgsm \
  -v $conf_path:/home/csgoserver
-it kevinanidjar/csgo-5on5-pug-dedicated-server

docker start $cname
docker ps 
