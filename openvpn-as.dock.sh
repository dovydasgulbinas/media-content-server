#!/bin/bash
#https://hub.docker.com/r/linuxserver/ranarr/

source media-user.sh

# container specific params

cname='openvpn-as'
cdir="$homedir/$cname-config"
iface='enp3s0'
sudo su - $uname -c "mkdir -p $cdir"


# remove container with same name if present
docker stop $cname
docker rm $cname

docker run \
  --name=$cname \
  -v $cdir:/config \
  -e PGID=$gid -e PUID=$uid \
  -e TZ=$tz \
  -e INTERFACE=$iface \
  --net=host \
  --privileged \
  linuxserver/openvpn-as


docker start $cname
docker ps
