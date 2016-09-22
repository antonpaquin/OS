FROM debian:jessie
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
        python3 \
        python-pip \
        build-essential \
        python-dev \
        python-numpy \
    && rm -rf /var/lib/apt/lists/*

RUN pip install numpy

ENTRYPOINT [ "/bin/bash" ]
