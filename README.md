# dshafik/memcached

This simple Dockerfile example will create an Ubuntu Wily based container with the memcached daemon.

## Building

To build issue the `docker build` command:

```sh
$ docker build -t $USER/memcached .
```

This will build the image, and tag it (`-t`) with `<your username>/memcached`.
  
### Verifying

To verify your new image has been built, run `docker images`:

```sh
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
$USER/memcached   latest              001bac9e2c92        7 minutes ago       199.3 MB
ubuntu              wily                0fe5a10d2cf8        8 days ago          132.4 MB
```

## Running

To run the image, use the `docker run` command:

```sh
$ docker run -d -p 11211:11211 $USER/memcached
```

This will run the container daemonized (`-d`), and map the exposed memcached port to the docker host machine.

### Verifying

To verify the container is running use `docker ps`:

```sh
$ docker ps
CONTAINER ID        IMAGE                      COMMAND                CREATED             STATUS              PORTS                      NAMES
b713f32569da        dshafik/memcached:latest   "memcached -u daemon   9 minutes ago       Up 9 minutes        0.0.0.0:11211->11211/tcp   evil_cori
```

## Connecting to memcached

To connect to the memcached instance, simply use `telnet`. If you are using Linux, you should be able to simply connect to localhost. However, if you are using `boot2docker` you will need to get the boot2docker host IP using `boot2docker ip`:

### Linux

```sh
$ telnet 127.0.0.1 11211
Trying 127.0.0.1...
Connected to 127.0.0.1.
Escape character is '^]'.

```

### Boot2Docker

For Mac, use the following:

```sh
$ telnet `boot2docker ip` 11211
Trying 192.168.59.103...
Connected to 192.168.59.103.
Escape character is '^]'.

```

On Windows, you will need to install or enable a telnet client, and to get the IP by calling `boot2gecko ip`.


## Cleanup Images

To remove all images *except* the `ubuntu/wiley` base image, use the following:

```sh
docker images -q | grep -v 0fe5a10d2cf8 | xargs docker rmi -f
```