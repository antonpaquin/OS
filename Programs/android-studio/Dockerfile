FROM ubuntu:16.04
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      lib32z1 \
      lib32ncurses5 \
      libbz2-1.0 \
      lib32stdc++6 \
      unzip \
      zenity \
      default-jdk \
      git

COPY android-studio-ide-143.2915827-linux.zip /root/android-studio/

RUN unzip /root/android-studio/android-studio-ide-143.2915827-linux.zip -d /root

ENTRYPOINT [ "/bin/bash" ]
