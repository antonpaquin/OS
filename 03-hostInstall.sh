groupadd docker &&
useradd -g docker -m anton &&
#Will go away
echo "root:grub" | chpasswd &&
echo "anton:anton" | chpasswd &&
pacman -S --noconfirm sudo &&

pacman -S --noconfirm docker &&
systemctl enable docker &&
systemctl start docker &&

mkdir /usr/dockerfiles &&
mkdir /usr/dockerscripts &&
PATH=$PATH:/usr/dockerscripts &&
su -c "mkdir /home/anton/.OS" anton &&
ln -s /home/anton/.OS /root/OS &&
#Fuck it I'm running x on the host _for now_
#mkdir /usr/dockerfiles/xorg &&
#curl https://raw.githubusercontent.com/antonpaquin/OS/master/xorg.docker > /usr/dockerfiles/xorg/Dockerfile &&
#docker build -t xorg /usr/dockerfiles/xorg &&

pacman -S --noconfirm xorg-server xorg-xinit xorg-xinput xorg-xhost &&
pacman -S --noconfirm xf86-input-libinput xf86-video-intel &&

pacman -S --noconfirm lightdm lightdm-gtk-greeter &&
echo "greeter-session=lightdm-gtk-greeter" >> /etc/lightdm/lightdm.conf &&

pacman -S --noconfirm fluxbox &&
pacman -S --noconfirm bswpm &&

pacman -S --noconfirm git &&
git config --global user.email "antonpaquin@gmail.com" &&
git config --global user.name "Anton Paquin" &&
git clone https://github.com/antonpaquin/OS /root &&

pacman -S --noconfirm alsa-utils &&

pacman -S --noconfirm dialog &&

cp /root/OS/ConfigFiles/Networks/ps50 /etc/netctl/ps50 &&
cp /root/OS/ConfigFiles/Networks/pnpWifi /etc/netctl/pnpWifi &&
cp /root/OS/ConfigFiles/bashrc /home/anton/.bashrc &&
cp /root/OS/ConfigFiles/asoundrc /home/anton/.asoundrc &&
cp /root/OS/ConfigFiles/modprobe.conf /etc/modprobe.d/modprobe.conf &&
cp /root/OS/ConfigFiles/fluxbox.keys /home/anton/.fluxbox/keys &&

mkdir /home/anton/Documents &&
mkdir /home/anton/Documents/School &&
mkdir /home/anton/Documents/Work &&
mkdir /home/anton/Downloads &&
mkdir /home/anton/Games &&
mkdir /home/anton/Misc &&
mkdir /home/anton/Pictures &&
mkdir /home/anton/Programming
