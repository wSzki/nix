

DISK=sdc

parted /dev/${DISK} -- mklabel gpt
parted /dev/${DISK} -- mkpart primary 512MiB -8GiB
parted /dev/${DISK} -- mkpart primary linux-swap -8GiB 100%
parted /dev/${DISK} -- mkpart ESP fat32 1MiB 512MiB
parted /dev/${DISK} -- set 3 esp on

mkfs.ext4 -L nixos /dev/${DISK}1
mkswap -L swap /dev/${DISK}2
swapon /dev/${DISK}2
mkfs.fat -F 32 -n boot /dev/${DISK}3        # (for UEFI systems only)
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot                      # (for UEFI systems only)
mount /dev/disk/by-label/boot /mnt/boot # (for UEFI systems only)
nixos-generate-config --root /mnt
vim /mnt/etc/nixos/configuration.nix
