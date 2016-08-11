#Based on jess/chromium
FROM debian:jessie
MAINTAINER Anton Paquin <antonpaquin@gmail.com>

RUN \
  echo 'deb http://httpredir.debian.org/debian testing main contrib non-free' >> /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y -t testing --no-install-recommends \
      chromium \
      chromium-l10n \
      alsa-utils \
      fontconfig \
      libgl1-mesa-dri \
	    libgl1-mesa-glx \
      pepperflashplugin-nonfree \
      browser-plugin-freshplayer-pepperflash \
      unifont \
      fonts-liberation \
      fonts-roboto \
      fonts-symbola \
  && rm -rf /var/lib/apt/lists/*

COPY asoundrc /root/.asoundrc

#At some point Arch will add user namespace support and I can have chrome sandboxing again"
ENTRYPOINT chromium --user-data-dir=/data --no-sandbox
