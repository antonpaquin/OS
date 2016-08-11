FROM debian:jessie
MAINTAINER Anton Paquin <antonpaquin@gmail.com>s

RUN  apt-get update \
  && apt-get install -y --no-install-recommends \
       acpi \
  && rm -rf /var/lib/apt/lists/*

COPY sysinfo.sh /root/sysinfo.sh

RUN echo "US/Pacific" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata

ENTRYPOINT [ "/root/sysinfo.sh" ]
