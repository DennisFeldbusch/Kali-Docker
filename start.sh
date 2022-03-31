#!/bin/bash

GREEN='\033[0;32m'
LBLUE='\033[1;34m'
NC='\033[0m' # No Color
echo -e "${LBLUE}"
echo '      ___           ___           ___           ___   '
echo '     /\__\         /\  \         /\__\         /\  \  '
echo '    /:/  /        /::\  \       /:/  /         \:\  \ '
echo '   /:/__/        /:/\:\  \     /:/  /          /::\__\'
echo '  /::\__\____   /::\ \:\  \   /:/  /          /:/\/__/'
echo ' /:/\:::::\__\ /:/\:\ \:\__\ /:/__/        __/:/  /   '
echo ' \/_|:|~~|~    \/__\:\/:/  / \:\  \       /\/:/  /    '
echo '    |:|  |          \::/  /   \:\  \      \::/__/     '
echo '    |:|  |          /:/  /     \:\__\      \:\__\     '
echo '    |:|  |         /:/  /       \/__/       \/__/     '
echo '     \|__|         \/__/      @author Soteri          '
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
docker run --hostname exKALIbur --cap-add=NET_ADMIN --device=/dev/net/tun --sysctl net.ipv6.conf.all.disable_ipv6=0 -p 3128:3128 -v $(pwd):/work --name kali -it --rm kali-docker ${1}
