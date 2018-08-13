#!/bin/bash

echo $(hostname)
mkdir  services
cp ./docker-compose.yml ./services/docker-compose.yml
#cp ./runservice.sh ./services/runservice.sh

sed -i "s/localhost/$(hostname)/" ./services/docker-compose.yml
cd services
docker-compose up -d 
cd ..

