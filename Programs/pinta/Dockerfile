FROM debian:jessie
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
        pinta \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "pinta" ]
