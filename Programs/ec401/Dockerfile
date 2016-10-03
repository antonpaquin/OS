FROM debian:jessie
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        build-essential \
        python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install numpy

ENTRYPOINT [ "/bin/bash" ]
