#Lightly edited from kry07/xorg
FROM debian:jessie
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

# Defaults, can be changed at build time
ARG DISPLAY=:0

ENV HOME /home/user
RUN useradd -u 1000 -G audio,video,users -s /bin/bash -m user
WORKDIR $HOME

ENV DEBIAN_FRONTEND noninteractive
ENV DISPLAY $DISPLAY
RUN apt-get update -y && apt-get install -y --no-install-recommends xorg

RUN perl -pi -e 's/=console/=anybody/' /etc/X11/Xwrapper.config

RUN apt-get install -y --no-install-recommends gdm3

RUN rm -rf /var/lib/apt/lists/*

CMD [ "/bin/bash" ]

#docker run \
#  -v /tmp/.X11-unix:/tmp/.X11-unix \
#  --device /dev:/dev \
#  -it \
#  -u user \
#  xorg
