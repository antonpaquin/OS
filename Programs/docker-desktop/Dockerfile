FROM debian:sid
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN  apt-get update \
  && apt-get install -y --no-install-recommends --fix-missing \
       feh \
       sxhkd \
       x11-utils \
  && rm -rf /var/lib/apt/lists/*

#Lemonbar, feh, rofi, dock, sxhkd

COPY desktop_driver.sh \
     wallhaven-blue+white.jpg \
     sxhkdrc \
     /root/

ENV SHELL /bin/sh

ENTRYPOINT [ "/root/desktop_driver.sh" ]
