FROM debian:jessie
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    gconf2 \
    gconf-service \
    gvfs-bin \
    libgtk2.0.0 \
    libnotify4 \
    libxtst6 \
    libnss3 \
    libasound2 \
    xdg-utils \
    curl \
    ca-certificates

RUN curl -L https://github.com/atom/atom/releases/download/v1.9.2/atom-amd64.deb > /root/atom-amd64.deb && \
    dpkg -i /root/atom-amd64.deb && \
    rm -rf /root/atom-amd64.deb

ENTRYPOINT [ "atom", "--foreground" ]
