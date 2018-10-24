FROM ubuntu:18.04
LABEL maintainer "Pavel Sviderski <me@psviderski.name>"

RUN apt-get update && apt-get install --no-install-recommends -y \
    sudo man less locales gnupg2 vim nano screen tmux ca-certificates curl wget \
    git python3 python3-pip \
    # Add fish-shell repo, gnupg2 is required for apt-key
    && echo "deb http://ppa.launchpad.net/fish-shell/release-2/ubuntu bionic main" > /etc/apt/sources.list.d/fish.list \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 6DC33CA5 \
    && apt-get install -y fish \
    && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV SHELL /usr/bin/fish

RUN useradd -m box -s /usr/bin/fish \
    && echo "box ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/box
USER box
WORKDIR /home/box

RUN curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher \
    && fish -c "fisher add oh-my-fish/theme-bobthefish"
COPY --chown=box:box config.fish .config/fish/

RUN pip3 install --user pipenv
COPY --chown=box:box myproject myproject
RUN git init ~/myproject

CMD ["/usr/bin/fish"]
