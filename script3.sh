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
