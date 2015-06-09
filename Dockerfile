FROM ubuntu:wily
MAINTAINER Davey Shafik <davey@engineyard.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y memcached

CMD ["memcached", "-u", "daemon"]

EXPOSE 11211
