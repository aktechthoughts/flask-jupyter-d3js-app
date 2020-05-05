#!/bin/bash

#remove containers
docker rm $(docker ps -a -f status=exited -q)  > /dev/null 2>&1
docker kill $(docker ps | awk '{ print $1 }' | grep -v 'CONTAINER') > /dev/null 2>&1

#remove image
#docker rmi $(docker images | grep 'aktechthoughts' | awk '{ print $3 }') --force > /dev/null 2>&1
docker rmi $(docker images | grep '<none>' | awk '{ print $3 }') --force > /dev/null 2>&1

