#!/bin/sh

DOTFILES=~/.dot
cd $HOME

old=_OLD_
echo $old
mkdir $old

mv .vimrc       $old/vimrc.old
mv .zshrc       $old/zshrc.old
mv .zprofile    $old/zprofile.old
mv .xinitrc     $old/xinitrc.old
mv .Xresources  $old/Xresources.old
mv .xbindkeysrc $old/xbindkeysrc.old
mv .tmux.conf   $old/tmux.conf.old
cp -r ~/.config $old/config

ln -s $DOTFILES/vim/init.vim     ~/.vimrc
ln -s $DOTFILES/zsh/zshrc        ~/.zshrc
ln -s $DOTFILES/zsh/zprofile     ~/.zprofile
ln -s $DOTFILES/xorg/xinitrc     ~/.xinitrc
ln -s $DOTFILES/xorg/xbindkeysrc ~/.xbindkeysrc
ln -s $DOTFILES/xorg/Xresources  ~/.Xresources
ln -s $DOTFILES/tmux/tmux.conf   ~/.tmux.conf

cp -r ~/.config                  $DOTFILES/config

cd -
