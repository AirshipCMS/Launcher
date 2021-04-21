FROM ubuntu

MAINTAINER AirshipCMS "admin@airshipcms.io"

RUN apt-get update && \
    apt-get install -y ca-certificates curl

WORKDIR /tmp

RUN export VERSION=$(curl -s https://install.airshipcms.io/Linux64/LATEST) && \
    curl -O https://install.airshipcms.io/Linux64/airship-${VERSION}.tar.bz2 && \
    tar -xjf airship-${VERSION}.tar.bz2 && \
    mv airship airship-server /usr/local/bin/

ENV HOME /airship
USER nobody
WORKDIR ${HOME}

EXPOSE 9800-9828
EXPOSE 9001
