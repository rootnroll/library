FROM ubuntu:16.04
MAINTAINER Pavel Sviderski <pavel@psviderski.name>

ENV FISH_VERSION 2.7.1-1~xenial

RUN echo "deb http://ppa.launchpad.net/fish-shell/release-2/ubuntu xenial main" > /etc/apt/sources.list.d/fish.list \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 6DC33CA5

RUN apt-get update && apt-get install --no-install-recommends -y \
    sudo man less locales vim nano screen tmux ca-certificates curl wget \
    fish=${FISH_VERSION} git \
 && rm -rf /var/lib/apt/lists/* \
 && locale-gen en_US.UTF-8 \
 && useradd -m box -s /usr/bin/fish \
 && echo "box ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/box

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

USER box
WORKDIR /home/box

COPY fish_init.fish /opt/fish_init.fish
COPY greeting /.greeting
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
