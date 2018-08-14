#!/bin/bash

MASTERNAME=$(cat fornodes.txt|awk 'NR==1{print}')
echo $MASTERNAME
MASTERIP=$(cat fornodes.txt|awk 'NR==2{print}')
echo $MASTERIP

HOSTADD="$MASTERIP $MASTERNAME"
hostsfile=/etc/hosts
echo $HOSTADD>>$hostsfile
echo $HOSTADD

DAEMONDIR=/etc/docker/daemon.json
echo "{">$DAEMONDIR
echo "  \"insecure-registries\" : [\"$MASTERNAME:4567\"]">>$DAEMONDIR
echo "}">>$DAEMONDIR
service docker restart
cat $DAEMONDIR

JOINSWARM=$(cat fornodes.txt|awk 'NR==3{print}')
sudo docker swarm leave
echo $JOINSWARM
$JOINSWARM

