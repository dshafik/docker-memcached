FROM ubuntu:wily
MAINTAINER Davey Shafik <davey@engineyard.com>

RUN apt-get update
RUN apt-get install -y memcached

CMD ["memcached", "-u", "daemon"]

EXPOSE 11211
