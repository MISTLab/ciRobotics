#!/bin/bash

TOKEN=$(cat sharedrunnertoken.txt|awk 'NR==1{print}')
echo $TOKEN
sed -i "s/aaaaaaaaaa/$TOKEN/" ./services/docker-compose.yml
cd services
docker-compose up -d 
cd ..
