FROM debian:sid
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
         dolphin-emu \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/usr/games/dolphin-emu" ]
