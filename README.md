# docker-nginx
[![Drone (cloud)](https://img.shields.io/drone/build/jee-r/docker-nginx?style=flat-square)](https://cloud.drone.io/jee-r/docker-nginx)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/j33r/nginx?style=flat-square)](https://microbadger.com/images/j33r/nginx)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/j33r/nginx?style=flat-square)](https://microbadger.com/images/j33r/nginx)
[![Docker Pulls](https://img.shields.io/docker/pulls/j33r/nginx?style=flat-square)](https://hub.docker.com/r/j33r/nginx)
[![DockerHub](https://img.shields.io/badge/Dockerhub-j33r/nginx-%232496ED?logo=docker&style=flat-square)](https://hub.docker.com/r/j33r/nginx)

A docker image for [nginx](https://nginx.org) ![nginx's logo](https://nginx.org/nginx.png)


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
