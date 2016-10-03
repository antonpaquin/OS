FROM ubuntu:16.04
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN    dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
         wget \
         gdebi \
         libgl1-mesa-dri:i386 \
         libgl1-mesa-glx:i386 \
         libc6:i386 \
    && wget http://media.steampowered.com/client/installer/steam.deb \
    && yes | gdebi steam.deb \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "steam" ]
