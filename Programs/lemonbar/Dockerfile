FROM debian:sid
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      lemonbar \
      fontconfig \
      unifont \
      fonts-font-awesome \
 && rm -rf /var/lib/apt/lists/*

COPY lemonbar.sh \
     lemonbar_r.sh \
     /root/

ENTRYPOINT [ "/root/lemonbar_r.sh" ]
