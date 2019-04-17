FROM rootnroll/demo-ubuntu:18.04
LABEL maintainer "Pavel Sviderski <me@psviderski.name>"

ENV POETRY_VERSION 0.12.7
USER box
WORKDIR /home/box

# Create a virtualenv for poetry to force it to use Python 3
RUN python3 -m venv ~/.virtualenvs/poetry \
    && curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | ~/.virtualenvs/poetry/bin/python \
    && echo "if status --is-login\n    set -gx PATH ~/.poetry/bin ~/.virtualenvs/poetry/bin \$PATH\nend" >> ~/.config/fish/config.fish
