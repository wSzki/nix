#!/bin/bash

DOTFILES_CONFIG=$DOTFILES/config

# Config Files
cp -r \
	~/.config/i3              \
	~/.config/ranger/         \
	~/.config/rofi/           \
	~/.config/mps-youtube     \
	~/.config/kitty           \
	~/.config/nvim/           \
	~/.config/ytfzf           \
	~/.config/bat             \
	~/.config/i3expo          \
	~/.config/xsuspender.conf \
	~/.config/dunst/          \
	~/.config/cointop/        \
	~/.config/mpv/            \
	~/.config/autorandr       \
	~/.config/cardboard       \
	$DOTFILES_CONFIG

mkdir -p $DOTFILES_CONFIG/coc
cp    -r ~/.config/coc/ultisnips $DOTFILES_CONFIG/coc

cd ${DOTFILES}
git add .
git status
git commit -m "Backup"
git push
cd -
