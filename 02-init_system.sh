#!/bin/sh

sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz home-manager
sudo nix-channel --update
sudo -i nix-channel --add https://github.com/musnix/musnix/archive/master.tar.gz musnix
sudo -i nix-channel --update musnix

cd ~/.config/
git clone https://github.com/musnix/musnix
