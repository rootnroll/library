# rootnroll/demo-ubuntu image comes with fish installed as a default shell. Nevertheless
# configure the fish-shell repo and reinstall the package in this Dockerfile to make sure
# that the expected version of fish is installed.
FROM rootnroll/demo-ubuntu:18.04
LABEL maintainer "Pavel Sviderski <me@psviderski.name>"

RUN echo "deb http://ppa.launchpad.net/fish-shell/release-3/ubuntu bionic main" > /etc/apt/sources.list.d/fish.list \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 6DC33CA5

ENV FISH_VERSION 3.0.2-1~bionic
RUN apt-get update && apt-get install --no-install-recommends -y fish=${FISH_VERSION} \
    && rm -rf /var/lib/apt/lists/*

COPY greeting /.greeting
COPY docker-entrypoint.sh /
WORKDIR /home/box
ENTRYPOINT ["/docker-entrypoint.sh"]
