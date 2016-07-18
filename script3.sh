useradd -m anton &&
#Will go away
echo "root:grub" | chpasswd &&
echo "anton:anton" | chpasswd &&
pacman -S --noconfirm sudo &&

pacman -S --noconfirm docker &&
systemctl enable docker &&
systemctl start docker &&

mkdir /usr/dockerfiles &&
mkdir /usr/dockerfiles/xorg &&
curl https://raw.githubusercontent.com/antonpaquin/OS/master/xorg.docker > /usr/dockerfiles/xorg/Dockerfile &&
docker build -t xorg /usr/dockerfiles/xorg &&
