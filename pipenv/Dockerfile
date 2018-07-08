FROM ubuntu:16.04
MAINTAINER Pavel Sviderski <pavel@psviderski.name>

RUN echo "deb http://ppa.launchpad.net/fish-shell/release-2/ubuntu xenial main" > /etc/apt/sources.list.d/fish.list \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 6DC33CA5

RUN apt-get update && apt-get install --no-install-recommends -y \
    sudo man less locales vim nano screen tmux ca-certificates curl wget \
    git fish python python3 \
 && rm -rf /var/lib/apt/lists/* \
 && curl https://bootstrap.pypa.io/get-pip.py | python3 \
 && locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV SHELL /usr/bin/fish

RUN useradd -m box -s /usr/bin/fish \
 && echo "box ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/box

USER box
WORKDIR /home/box

RUN curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher \
 && fish -c "fisher omf/theme-bobthefish"
COPY --chown=box:box config.fish /home/box/.config/fish/

RUN pip install --user pipenv
COPY --chown=box:box myproject /home/box/myproject

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
