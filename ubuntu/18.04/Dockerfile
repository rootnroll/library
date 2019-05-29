FROM ubuntu:18.04
LABEL maintainer "Pavel Sviderski <me@psviderski.name>"

RUN apt-get update && apt-get --no-install-recommends -y install \
    sudo man less locales gnupg2 vim nano screen tmux ca-certificates curl wget net-tools \
    git rsync \
    python3 python3-pip python3-venv \
    # Add fish-shell repo and install fish, gnupg2 is required for apt-key
    && echo "deb http://ppa.launchpad.net/fish-shell/release-3/ubuntu bionic main" > /etc/apt/sources.list.d/fish.list \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 6DC33CA5 \
    && apt-get update && apt-get install --no-install-recommends -y fish \
    && rm -rf /var/lib/apt/lists/*
RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV GOSU_VERSION 1.11
RUN wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64" \
    && chmod +x /usr/local/bin/gosu

RUN useradd -m box -s /usr/bin/fish \
    && echo "box ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/box

# Install fisher package manager and configure the Powerline-style bobthefish theme
RUN gosu box curl -Lo /home/box/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher \
    && gosu box fish -c "fisher add oh-my-fish/theme-bobthefish"
COPY --chown=box:box config.fish /home/box/.config/fish/
ENV SHELL /usr/bin/fish

CMD ["/usr/bin/fish", "-l"]
