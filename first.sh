#!/bin/bash
destdir=./fornodes.txt
echo $(hostname)>"$destdir"
IPADDR="$(ip route get 1 | awk '{print $NF;exit}')"
echo $IPADDR>>"$destdir"
docker swarm leave -f
SWARMJOIN="$(docker swarm init --advertise-addr $IPADDR |awk '/SWMTKN/{print}')"
echo $SWARMJOIN>>"$destdir"
echo $SWARMJOIN

echo "Please type your project name, which is used as service name"
read PROJECTNAME
echo $PROJECTNAME
docker service create --mode=global  --with-registry-auth --constraint node.role==worker -d --name $PROJECTNAME  --env="DISPLAY" --env QT_X11_NO_MITSHM=1   --mount type=bind,source=/tmp/.X11-unix,destination=/tmp/.X11-unix u16-vbw2:4567/root/$PROJECTNAME ping google.com

git add "$destdir"
git commit -a -m "Add fornodes for other nodes to use"
git push
