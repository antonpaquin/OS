FROM debian:sid
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
        surf \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "surf",  "http://172.17.0.1:8080/" ]
