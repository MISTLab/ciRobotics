#!/bin/bash

MASTERNAME=$(cat fornodes.txt|awk 'NR==1{print}')
echo $MASTERNAME
MASTERIP=$(cat fornodes.txt|awk 'NR==2{print}')
echo $MASTERIP
HOSTADD="$MASTERIP $MASTERNAME"
hostsfile=/etc/hosts
echo $HOSTADD>>$hostsfile
echo $HOSTADD
JOINSWARM=$(cat fornodes.txt|awk 'NR==3{print}')
sudo docker swarm leave -f
echo $JOINSWARM
$JOINSWARM
