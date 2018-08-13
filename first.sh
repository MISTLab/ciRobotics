#!/bin/bash
destdir=./fornodes.txt
echo $(hostname)>"$destdir"
IPADDR="$(ip route get 1 | awk '{print $NF;exit}')"
echo $IPADDR>>"$destdir"
docker swarm leave -f
SWARMJOIN="$(docker swarm init --advertise-addr $IPADDR |awk '/SWMTKN/{print}')"
echo $SWARMJOIN>>"$destdir"

git add "$destdir"
git commit -a -m "Add fornodes for other nodes to use"
git push
