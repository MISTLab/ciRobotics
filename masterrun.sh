#!/bin/bash

echo $(hostname)
mkdir  services
cp ./docker-compose.yml ./services/docker-compose.yml
#cp ./runservice.sh ./services/runservice.sh


destdir=./fornodes.txt
echo $(hostname)>"$destdir"
IPADDR="$(ip route get 1 | awk '{print $NF;exit}')"
echo $IPADDR>>"$destdir"
docker swarm leave -f
SWARMJOIN="$(docker swarm init --advertise-addr $IPADDR |awk '/SWMTKN/{print}')"
echo $SWARMJOIN>>"$destdir"
echo $SWARMJOIN


sed -i "s/localhost/$(hostname)/" ./services/docker-compose.yml
cd services
docker-compose up -d 
cd ..

