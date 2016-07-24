install() {
  cp /root/OS/RunScripts/$1 /usr/dockerscripts/$1 &&
  mkdir -p /usr/dockerfiles/$1 &&
  cp /root/OS/Dockerfiles/$1 /usr/dockerfiles/$1/Dockerfile &&
  chmod +x /usr/dockerscripts/$1 &&
  docker build -t $1 /usr/dockerfiles/$1
}

install atom
install chromium
