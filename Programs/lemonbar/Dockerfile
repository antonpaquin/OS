FROM debian:sid
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN  apt-get update \
  && apt-get install -y --no-install-recommends --fix-missing \
       python3 \
       lemonbar \
       fontconfig \
       unifont \
       fonts-font-awesome

#Lemonbar, feh, rofi, dock, sxhkd

COPY lemonbar.py \
     lemonbar.sh \
     /root/

ENV SHELL /bin/sh

ENTRYPOINT [ "/root/lemonbar.sh" ]
