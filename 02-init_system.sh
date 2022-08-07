#!/bin/sh

# Unstable repo
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos

# Home manager
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz home-manager
sudo nix-channel --update
# Musnix
sudo -i nix-channel --add https://github.com/musnix/musnix/archive/master.tar.gz musnix
sudo -i nix-channel --update musnix

nixos-rebuild switch --upgrade


#cd ~/.config/
#git clone https://github.com/musnix/musnix
