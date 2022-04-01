#!/bin/bash

GREEN='\033[0;32m'
LBLUE='\033[1;34m'
NC='\033[0m' # No Color
echo -e "${LBLUE}"
echo 'KALI';
echo -e "${NC}"
echo ' '
echo ' '
echo 'Start building docker image:'
start=$SECONDS
docker build -q -t kali-docker .
duration=$(( SECONDS - start ))

echo ''

echo -e "${GREEN}Building successful :)${NC}"
echo ''
echo -e "Built in ${duration} Seconds"

echo 'Start running docker:'
docker run --network -v container:proxyDock -v $(pwd):/work  --rm -it pen-dock
