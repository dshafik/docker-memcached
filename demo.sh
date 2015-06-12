#!/bin/bash
docker images -q | grep -v 0fe5a10d2cf8 | xargs docker rmi -f &>/dev/null 
echo "docker build -t dshafik/memcached ."
docker build -t dshafik/memcached .
