#/bin/bash
source ./docker-ps.sh
docker run -d -p 11211:11211 dshafik/memcached
dps
telnet `boot2docker ip` 11211
docker stop `docker ps -q`
