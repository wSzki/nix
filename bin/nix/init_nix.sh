#!/bin/sh

mkdir -p ~/.tmp
mv            \
	.config   \
	.zshrc    \
	.vimrc    \
	.zprofile \
	~/.tmp

ln -s ~/.nix/config ~/.config

sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz home-manager
sudo nix-channel --update

cd ~/.config/
git clone https://github.com/musnix/musnix
