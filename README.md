# docker-nginx

[![Drone (cloud)](https://img.shields.io/drone/build/jee-r/docker-nginx?&style=flat-square)](https://cloud.drone.io/jee-r/docker-nginx)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/j33r/nginx?style=flat-square)](https://microbadger.com/images/j33r/nginx)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/j33r/nginx?style=flat-square)](https://microbadger.com/images/j33r/nginx)
[![Docker Pulls](https://img.shields.io/docker/pulls/j33r/nginx?style=flat-square)](https://hub.docker.com/r/j33r/nginx)
[![DockerHub](https://shields.io/badge/Dockerhub-j33r/nginx-%232496ED?logo=docker&style=flat-square)](https://hub.docker.com/r/j33r/nginx)

A docker image for [nginx](https://nginx.org) ![nginx's logo](https://nginx.org/nginx.png)

# Supported tags

| Tags | Nginx Version | Features | Size | Layers |
|-|-|-|-|-|
| `latest`, `stable`, `master` | <RESERVED_1> | <RESERVED_2> | ![](https://img.shields.io/docker/image-size/j33r/nginx/latest?style=flat-square) | ![MicroBadger Layers (tag)](https://img.shields.io/microbadger/layers/j33r/nginx/latest?style=flat-square) |
| `dev` | <RESERVED_1> | <RESERVED_2> | ![](https://img.shields.io/docker/image-size/j33r/nginx/dev?style=flat-square) | ![MicroBadger Layers (tag)](https://img.shields.io/microbadger/layers/j33r/nginx/dev?style=flat-square) |
| `autoindex` | <RESERVED_1> | <RESERVED_2> | ![](https://img.shields.io/docker/image-size/j33r/nginx/autoindex?style=flat-square) | ![MicroBadger Layers (tag)](https://img.shields.io/microbadger/layers/j33r/nginx/autoindex?style=flat-square) |

# What is Nginx?

From [nginx](https://nginx.org):

>  nginx [engine x] is an HTTP and reverse proxy server, a mail proxy server, and a generic TCP/UDP proxy server, originally written by Igor Sysoev. For a long time, it has been running on many heavily loaded Russian sites including Yandex, Mail.Ru, VK, and Rambler. According to Netcraft, nginx served or proxied 25.20% busiest sites in November 2020. Here are some of the success stories: Dropbox, Netflix, Wordpress.com, FastMail.FM.

# How to use these images

```bash
docker run \
    --detach \
    --interactive \
    --name nginx \
    --user $(id -u):$(id -g) \
    --env TZ=Europe/Paris \
    --volume /etc/localtime:/etc/localtime:ro \
    --publish 8080:8080 \
    j33r/nginx:latest
```    

## Volume mounts


```bash
docker run \
    --detach \
    --interactive \
    --name nginx \
    --user $(id -u):$(id -g) \
    --volume /path/to/your/<VOLUME>:<VOLUME> \
    j33r/nginx:latest
```

You should create directory before run the container otherwise directories are created by the docker deamon and owned by the root user

## Environment variables

To change the timezone of the container set the `TZ` environment variable. The full list of available options can be found on [Wikipedia](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).

You can also set the `HOME` environment variable this is usefull to get in the right directory when you attach a shell in your docker container.


## Docker Compose

[`docker-compose`](https://docs.docker.com/compose/) can help with defining the `docker run` config in a repeatable way rather than ensuring you always pass the same CLI arguments.

Here's an example `docker-compose.yml` config:

```yaml
version: "3"

services:
  nginx:
    image: j33r/nginx:latest    
    user: "${UID:-1000}:${GID:-1000}"
    restart: unless-stopped
    environment:
        - HOME=/app
        - TZ=Europe/Paris
    volumes:
        - /etc/localtime:/etc/localtime:ro
```

# License

This project is under the [GNU Generic Public License v3](https://github.com/jee-r/docker-nginx/blob/master/LICENSE) to allow free use while ensuring it stays open.

# Credits

<CREDIT>




```
version: "3.8"

services:
  nginx:
    build:
      context: ./build/nginx
      args:
        - GID=${GID}
        - GROUP_NAME=php
    image: nginx:latest
    #container_name: nginx
    restart: unless-stopped
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - php:/php
      - app:/app
    ports:
      - "8080:8080"

volumes:
  php:
  app:
  app_db:

```
