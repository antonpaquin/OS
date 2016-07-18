parted -s /dev/sda mklabel gpt &&
parted -s /dev/sda mkpart ESP fat32 1MB 1GB &&
parted -s /dev/sda set 1 boot on &&
parted -s /dev/sda name 1 boot &&
parted -s /dev/sda mkpart swap 1GB 33GB &&
parted -s /dev/sda name 2 swap &&
parted -s /dev/sda mkpart primary ext4 33GB 100% &&
parted -s /dev/sda name 3 main &&

mkfs.fat -F32 /dev/sda1 &&

mkswap /dev/sda2 &&
swapon /dev/sda2 &&

mkfs.ext4 /dev/sda3 &&

mount /dev/sda3 /mnt &&

awk 'f{print;f=0} /United States/{f=1}' /etc/pacman.d/mirrorlist | head -10 > /etc/pacman.d/mirrorlist.tmp &&
mv /etc/pacman.d/mirrorlist.tmp /etc/pacman.d/mirrorlist &&

pacstrap /mnt base &&

genfstab -p /mnt >> /mnt/etc/fstab &&

echo "Chrooting, load up the next script in the new env" &&
arch-chroot /mnt
