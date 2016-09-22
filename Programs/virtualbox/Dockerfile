FROM ubuntu:16.04
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN    echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y curl \
    && curl https://www.virtualbox.org/download/oracle_vbox_2016.asc > /root/oracle_vbox_2016.asc \
    && apt-key add /root/oracle_vbox_2016.asc \
    && apt-get install -y --no-install-recommends --allow-unauthenticated \
        virtualbox-5.1

COPY winXP.vdi /root/images/

ENTRYPOINT [ "virtualbox" ]
