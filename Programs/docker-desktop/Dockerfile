FROM debian:sid
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN  apt-get update \
  && apt-get install -y --no-install-recommends --fix-missing \
       python3 \
       lemonbar \
       fontconfig \
       unifont \
       fonts-font-awesome \
       feh \
       nautilus \
       gnome-sushi \
       gnome-icon-theme-symbolic \
       sxhkd \
       x11-utils \
       rofi \
  && rm -rf /var/lib/apt/lists/*

#Lemonbar, feh, rofi, dock, sxhkd

COPY lemonbar.py \
     desktop_driver.sh \
     wallhaven-blue+white.jpg \
     sxhkdrc \
     /root/

ENV SHELL /bin/sh

ENTRYPOINT [ "/root/desktop_driver.sh" ]
