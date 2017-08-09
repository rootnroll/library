FROM ubuntu:16.04
MAINTAINER Pavel Sviderski <pavel@psviderski.name>

RUN apt-get update && apt-get install --no-install-recommends -y \
    sudo man less locales vim nano screen tmux ca-certificates curl wget \
    zsh git python3 python3-pip \
 && rm -rf /var/lib/apt/lists/* \
 && locale-gen en_US.UTF-8 \
 && useradd -m box -s /bin/zsh \
 && echo "box ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/box

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

USER box

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true \
 && sed -ir "s/^plugins=.*/plugins=(git sudo screen tmux)/" ~/.zshrc
WORKDIR /home/box/.oh-my-zsh

COPY greeting /.greeting
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
