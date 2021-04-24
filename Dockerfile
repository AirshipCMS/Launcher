FROM alpine

MAINTAINER AirshipCMS "admin@airshipcms.io"

# airship is dynamically linked
# depends on libstdc++.so. libgcc_s.so.1
RUN apk update && apk add \
    libc6-compat gcompat libstdc++ \
    ca-certificates \
    curl

WORKDIR /tmp

RUN export VERSION=$(curl -s https://install.airshipcms.io/Linux64/LATEST) && \
    curl -O https://install.airshipcms.io/Linux64/airship-${VERSION}.tar.bz2 && \
    tar -xjf airship-${VERSION}.tar.bz2 && \
    mv airship airship-server /usr/local/bin/

RUN apk del curl

ENV HOME /srv
USER nobody
WORKDIR ${HOME}

EXPOSE 9800-9828
EXPOSE 9001
