docker images -q | grep -v 0fe5a10d2cf8 | xargs docker rmi -f
