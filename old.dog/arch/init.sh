#!/bin/sh

useradd -m -G wheel -s /bin/zsh wsz
usermod -a -G video wsz

passwd wsz

# Packages
###########
pacman -Sy \
	sudo                \
	zsh                 \
	ack                 \
	fzf                 \
	git                 \
	vim                 \
	gcc                 \
	php                 \
	lua                 \
	rofi                \
	acpi                \
	acpid               \
	libx11              \
	libxft              \
	clang               \
	make                \
	python2             \
	python3             \
	python-pip          \
	nodejs              \
	yarn                \
	redshift            \
	unclutter           \
	xorg                \
	xorg-xinit          \
	neovim              \
	dunst               \
	xautolock           \
	xbindkeys           \
	firefox             \
	feh                 \
	nomacs              \
	evince              \
	arandr              \
	lxappearance        \
	telegram-desktop    \
	barrier             \
	bitwarden           \
	pipewire-alsa       \
	acpilight           \
	tlp                 \
	powertop            \
	cpupower            \
	i3-gaps             \
	i3blocks            \
	i3status            \
	valgrind            \
	gdb                 \
	scrot               \
	peek                \
	xclip               \
	xcolor              \
	tree                \
	nemo                \
	tldr                \
	ncdu                \
	youtube-dl          \
	curl                \
	wget                \
	xdotool             \
	torbrowser-launcher \
	playerctl           \
	fdupes              \
	fasd                \
	dust                \
	lfs                 \
	gtop                \
	bat                 \
	trash-cli           \
	mpv                 \
	vlc

# Paru
#######
pacman -Sy --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf ./paru

# Fonts
########
paru -Sy \
	ttf-nerd-fonts-symbols-mono \
	ttf-inconsolata \
	ttf-roboto-mono \
	ttf-scientifica


visudo
su wsz

