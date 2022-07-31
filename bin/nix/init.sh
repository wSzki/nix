#!/bin/sh


mkdir -p ~/.tmp
mv            \
	.config   \
	.zshrc    \
	.vimrc    \
	.zprofile \
	~/.tmp

echo "ZDOTDIR=~/.nix/config/zsh/" > .zshenv

