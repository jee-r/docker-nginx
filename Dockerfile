FROM nginxinc/nginx-unprivileged:alpine

LABEL name="docker-<PROJECT_NAME>" \
      maintainer="Jee jee@jeer.fr" \
      description="<PROJECT_SHORT_DESCRIPTION" \
      url="<PROJECT_URL>" \
      org.label-schema.vcs-url="https://github.com/jee-r/docker-<PROJECT_NAME>"

USER root

COPY rootfs /

RUN sed -i 's/http:\/\/dl-cdn.alpinelinux.org/https:\/\/mirrors.ircam.fr\/pub/' /etc/apk/repositories && \
    apk update && \
    apk upgrade && \
    apk --no-cache add shadow && \
    echo "Add Group ${GROUP_NAME} with gid ${GID}" && \
    if [ "$(grep ':'${GID}':' /etc/group)" == "" ]; then \
      addgroup -g ${GID} ${GROUP_NAME}; \
    else \
      GROUP_NAME=$(grep ':'${GID}':' /etc/group | cut -d: -f1); \
    fi && \
    usermod -a -G ${GID} nginx
