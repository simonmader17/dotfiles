#!/bin/bash

mkdir -pv ~/.config

mkdir -pv ~/.config/alacritty
ln -sfv ~/my-configs/my-alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

ln -sfv ~/my-configs/my-bashrc/.bashrc ~/.bashrc

mkdir -pv ~/.config/i3
ln -sfv ~/my-configs/my-i3/i3.config ~/.config/i3/config

ln -sfv ~/my-configs/my-picom/picom.conf ~/.config/picom.conf

mkdir -pv ~/.config/ranger
ln -sfv ~/my-configs/my-ranger/rc.conf ~/.config/ranger/rc.conf
ln -sfv ~/my-configs/my-ranger/scope.sh ~/.config/ranger/scope.sh

mkdir -pv ~/.vim/snippets
ln -sfv ~/my-configs/my-snippets/_.snippets ~/.vim/snippets/_.snippets

ln -sfv ~/my-configs/my-vimrc/.vimrc-linux ~/.vimrc
