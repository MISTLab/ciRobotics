#!/bin/bash

destdir=./fornodes.txt

echo "Please type your project name in gitlab, which is used as service name"
read PROJECTNAME
echo $PROJECTNAME>>"$destdir"
#echo $PROJECTNAME
docker service rm $PROJECTNAME
docker service create --mode=global  --with-registry-auth --constraint node.role==worker -d --name $PROJECTNAME  --env="DISPLAY" --env QT_X11_NO_MITSHM=1   --mount type=bind,source=/tmp/.X11-unix,destination=/tmp/.X11-unix $(hostname):4567/root/$PROJECTNAME ping google.com

git add "$destdir"
echo "Please type your github account email address, where you fork this project to"
read GITHUBACCOUNT
git config --global user.email $GITHUBACCOUNT
git commit -a -m "Add fornodes for other nodes to use"
git push
