#!/bin/sh


mkdir -p ~/.tmp
mv            \
	.config   \
	.zshrc    \
	.vimrc    \
	.zprofile \
	~/.tmp

echo "ZDOTDIR=~/.nix/config/zsh/" > .zshenv

cd ~/.config/
git clone https://github.com/musnix/musnix

