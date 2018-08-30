#!/bin/bash

#https://zeronet.readthedocs.io/en/latest/using_zeronet/installing/

source media-user.sh

# container specific params

cname='zeronet' 
port_service=15441
port_ui=43110
tor='true'

ddir="/media/raid/media/downloads/$cname-dl"


sudo su - $uname -c "mkdir -p $ddir"

# remove container with same name if present
docker stop $cname
docker rm $cname

docker run --name=$cname -d -e "ENABLE_TOR=$tor" -v $ddir:/root/data -p $port_service:15441 -p "0.0.0.0:$port_ui:43110" nofish/zeronet

docker start $cname
docker ps
