#!/bin/bash

# https://github.com/kevin-anidjar/csgo-5on5-pug-dedicated-server

cname="ebot"
conf_path="$HOME/diy/docker/csgo"
#lgsmdir="$conf_path/lgsm-confs"  # place where you store confs on local machine
#mkdir -p $lgsmdir 

# remove container with same name if present
docker stop $cname
docker rm $cname

docker run --name=$cname \
  -p 8081:8081 \
  -it jamesyale/docker-ebot-csgo

docker start $cname
docker ps 
