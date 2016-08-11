FROM ubuntu:16.04
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN  apt-get update \
  && apt-get install -y --no-install-recommends \
       lib32z1 \
       lib32ncurses5 \
       libbz2-1.0 \
       lib32stdc++6 \
       unzip \
       zenity \
       default-jdk \
       git \
  && rm -rf /var/lib/apt/lists/*

COPY android-studio-ide-143.2915827-linux.zip android-sdk-r24.4.1-linux.tgz /root/

RUN unzip /root/android-studio/android-studio-ide-143.2915827-linux.zip -d /root && \
    mkdir /root/android-sdk && \
    tar -xf /root/android-studio/android-sdk-r24.4.1-linux.tgz -C /root/android-sdk

ENTRYPOINT [ "/bin/bash" ]
