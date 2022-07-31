
DISK=vda

 parted /dev/${DISK} -- mklabel msdos
 parted /dev/${DISK} -- mkpart primary 1MiB -8GiB
 parted /dev/${DISK} -- mkpart primary linux-swap -8GiB 100%

 mkfs.ext4 -L nixos /dev/${DISK}1
mkswap -L swap /dev/${DISK}2
swapon /dev/${DISK}2
mount /dev/disk/by-label/nixos /mnt
nixos-generate-config --root /mnt
vim /mnt/etc/nixos/configuration.nix
