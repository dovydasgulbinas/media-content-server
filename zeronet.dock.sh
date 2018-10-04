#!/bin/bash

#https://zeronet.readthedocs.io/en/latest/using_zeronet/installing/

source media-user.sh

# container specific params

cname='zeronet' 
port_service=15441
port_ui=43110
tor='true'
listen_ip='192.168.0.8'

ddir="/media/raid/media/downloads/$cname-dl"


sudo su - $uname -c "mkdir -p $ddir"

# remove container with same name if present
docker stop $cname
docker rm $cname

docker run --name=$cname -d -e "ENABLE_TOR=$tor" -v $ddir:/root/data -p $port_service:15441 -p "$listen_ip:$port_ui:43110" nofish/zeronet

docker start $cname
docker ps
