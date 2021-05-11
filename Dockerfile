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
    mv airship airship-server /usr/local/bin/ && \
    rm airship-${VERSION}.tar.bz2

RUN apk del curl

ENV HOME /home
RUN echo -e "export PS1=$'\e[32m\[\[\e[36m\]\[\xF0\x9F\x90\xB3\] Airship Launcher\e[32m\] $\[\e[m\] '" >> /etc/profile.d/airship_prompt.sh
USER nobody
WORKDIR /srv

EXPOSE 9800-9828
EXPOSE 9001

CMD ["/bin/ash", "-l"]
