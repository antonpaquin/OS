#Based on jess/chromium
FROM debian:jessie
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN useradd -m user

RUN \
  echo 'deb http://httpredir.debian.org/debian testing main contrib non-free' >> /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y -t testing --no-install-recommends \
     chromium \
     chromium-l10n

RUN \
    apt-get install -y --no-install-recommends \
      alsa-utils \
      fontconfig \
      libgl1-mesa-dri \
	    libgl1-mesa-glx \
      pepperflashplugin-nonfree \
      browser-plugin-freshplayer-pepperflash

RUN apt-get install -y --no-install-recommends \
      unifont \
      fonts-liberation \
      fonts-roboto \
      fonts-symbola

COPY asoundrc /root/.asoundrc

#At some point Arch will add user namespace support and I can have chrome sandboxing again"
ENTRYPOINT chromium --user-data-dir=/data --no-sandbox
