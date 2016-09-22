FROM debian:jessie
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
        mpv \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/bin/bash" ]
