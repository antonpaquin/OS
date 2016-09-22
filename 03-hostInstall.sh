groupadd docker &&
useradd -g docker -m anton &&

#Set passwords
#Will go away
echo "root:grub" | chpasswd &&
echo "anton:anton" | chpasswd &&
pacman -S --noconfirm sudo &&

#Grabbing an old version of docker because of a go-related bug.
mkdir /home/anton/.tmp &&
curl https://archive.archlinux.org/packages/d/docker/docker-1%3A1.10.3-1-x86_64.pkg.tar.xz > /home/anton/.tmp/docker-1:1.10.3-1-x86_64.pkg.tar.xz &&

#Finally get docker
pacman -U --noconfirm /home/anton/.tmp/docker-1:1.10.3-1-x86_64.pkg.tar.xz &&
systemctl enable docker &&
systemctl start docker &&

#Build docker paths
mkdir /usr/dockerfiles &&
mkdir /usr/dockerscripts &&
PATH=$PATH:/usr/dockerscripts &&
su -c "mkdir /home/anton/.OS" anton &&
ln -s /home/anton/.OS /root/OS &&
#Fuck it I'm running x on the host _for now_
#mkdir /usr/dockerfiles/xorg &&
#curl https://raw.githubusercontent.com/antonpaquin/OS/master/xorg.docker > /usr/dockerfiles/xorg/Dockerfile &&
#docker build -t xorg /usr/dockerfiles/xorg &&

#Sadly I need X on host
pacman -S --noconfirm xorg-server xorg-xinit xorg-xinput xorg-xhost &&
pacman -S --noconfirm xf86-input-libinput xf86-video-intel &&

#And lightdm
pacman -S --noconfirm lightdm lightdm-gtk-greeter &&
echo "greeter-session=lightdm-gtk-greeter" >> /etc/lightdm/lightdm.conf &&

#And WM's
pacman -S --noconfirm bswpm &&

#And git, but actually I'm fine with this
pacman -S --noconfirm git &&
git config --global user.email "antonpaquin@gmail.com" &&
git config --global user.name "Anton Paquin" &&
git clone https://github.com/antonpaquin/OS /root &&

#Make sound work
pacman -S --noconfirm alsa-utils &&

#In a pinch, wifi-menu is better than manually copying netctl confs
pacman -S --noconfirm dialog &&

pacman -S --noconfirm openssh &&
pacman -S --noconfirm unzip &&

#Shell
pacman -S --noconfirm rxvt-unicode &&

#Establish home directory
mkdir /home/anton/Documents &&
mkdir /home/anton/Documents/School &&
mkdir /home/anton/Documents/Work &&
mkdir /home/anton/Downloads &&
mkdir /home/anton/Games &&
mkdir /home/anton/Misc &&
mkdir /home/anton/Pictures &&
mkdir /home/anton/Programming &&
mkdir /home/anton/.bin &&
mkdir /home/anton/.common &&
mkdir /home/anton/.config &&
mkdir /home/anton/.data &&
mkdir /home/anton/.tmp &&

#Moving around config files
cp /root/OS/ConfigFiles/Networks/ps50 /etc/netctl/ps50 &&
cp /root/OS/ConfigFiles/Networks/pnpwifi /etc/netctl/pnpwifi &&
cp /root/OS/ConfigFiles/bashrc /home/anton/.bashrc &&
cp /root/OS/ConfigFiles/asoundrc /home/anton/.asoundrc &&
cp /root/OS/ConfigFiles/modprobe.conf /etc/modprobe.d/modprobe.conf &&
cp /root/OS/ConfigFiles/fluxbox.keys /home/anton/.fluxbox/keys &&
cp /root/OS/ConfigFiles/bspwmrc /home/anton/.config/bspwm/bspwmrc &&
cp /root/OS/

#Holy fuck permissions are annoying
chmod +x /home/anton/.config/bspwm/bspwmrc
