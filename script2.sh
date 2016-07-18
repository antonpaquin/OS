ln -s /usr/share/zoneinfo/US/Pacific /etc/localtime &&

cat /etc/locale.gen | grep en_US | tail -n 2 | cut -c 2- > /etc/locale.gen.tmp &&
mv /etc/locale.gen.tmp /etc/locale.gen &&
locale-gen &&

echo "Nimitz" > /etc/hostname &&

curl "https://raw.githubusercontent.com/antonpaquin/OS/master/ps50" > /etc/netctl/ps50 &&

mkinitcpio -p linux &&

passwd &&

pacman -S --noconfirm refind-efi &&
echo "Exit chroot and reboot, the system should be installed!"
