FROM debian:sid
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
        blender \
        libgl1-mesa-dri \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "blender" ]
