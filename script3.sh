useradd -m anton &&
#Will go away
echo "root:grub" | chpasswd &&
echo "anton:anton" | chpasswd &&
pacman -S --noconfirm sudo &&

pacman -S --noconfirm docker &&
systemctl enable docker &&
systemctl start docker &&

mkdir /usr/dockerfiles &&
#Fuck it I'm running x on the host _for now_
#mkdir /usr/dockerfiles/xorg &&
#curl https://raw.githubusercontent.com/antonpaquin/OS/master/xorg.docker > /usr/dockerfiles/xorg/Dockerfile &&
#docker build -t xorg /usr/dockerfiles/xorg &&
#
#docker run \
#  -v /tmp/.X11-unix:/tmp/.X11-unix \
#  --device /dev:/dev \
#  -it \
#  -u user \
#  xorg

pacman -S --noconfirm xorg-server xorg-xinit xorg-xinput &&
pacman -S --noconfirm xf86-input-libinput xf86-video-intel

pacman -S --noconfirm lightdm lightdm-gtk-greeter &&
echo "greeter-session=lightdm-gtk-greeter" >> /etc/lightdm/lightdm.conf &&

pacman -S --noconfirm fluxbox
