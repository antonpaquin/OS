FROM debian:jessie
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
        hexchat \
        unzip \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "hexchat" ]
