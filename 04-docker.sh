install() {
  cp /root/OS/RunScripts/$1 /usr/dockerscripts/$1 &&
  mkdir -p /usr/dockerfiles/$1 &&
  cp /root/OS/Dockerfiles/$1 /usr/dockerfiles/$1/Dockerfile &&
  chmod +x /usr/dockerscripts/$1 &&
  docker build -t $1 /usr/dockerfiles/$1
}

mkdir -p /usr/dockerfiles/sysinfo
cp -p /root/OS/Resources/sysinfo.sh /usr/dockerfiles/sysinfo/sysinfo.sh

mkdir -p /usr/dockerfiles/chromium
cp /root/OS/ConfigFiles/asoundrc /usr/dockerfiles/chromium/asoundrc

mkdir -p /usr/dockerfiles/lemonbar
cp -p /root/OS/ConfigFiles/lemonbar.sh /usr/dockerfiles/lemonbar/lemonbar.sh
cp -p /root/OS/Resources/lemonbar_r.sh /usr/dockerfiles/lemonbar/lemonbar_r.sh


install atom
install chromium
install sysinfo
install libreoffice
install lemonbar
install playground
