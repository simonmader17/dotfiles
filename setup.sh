#!/bin/bash

mkdir -pv ~/.config

mkdir -pv ~/.config/alacritty
ln -sfv ~/my-configs/my-alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

ln -sfv ~/my-configs/my-bashrc/.bashrc ~/.bashrc

mkdir -pv ~/.config/fish
ln -sfv ~/my-configs/my-fish/config.fish.sh ~/.config/fish/config.fish

git clone https://github.com/tobi-wan-kenobi/bumblebee-status.git ~/.config/bumblebee-status

mkdir -pv ~/.config/i3
ln -sfv ~/my-configs/my-i3/i3.config ~/.config/i3/config

git clone https://github.com/gabrielelana/awesome-terminal-fonts ~/Downloads/awesome-terminal-fonts
mkdir -pv ~/.fonts
cp -fv ~/Downloads/awesome-terminal-fonts/build/*.ttf ~/.fonts
cp -fv ~/Downloads/awesome-terminal-fonts/build/*.sh ~/.fonts
mkdir -pv ~/.config/fontconfig/conf.d
cp -fv ~/Downloads/awesome-terminal-fonts/config/* ~/.config/fontconfig/conf.d
fc-cache -fv ~/.fonts

git clone https://github.com/powerline/fonts.git ~/Downloads/powerline-fonts
source ~/Downloads/powerline-fonts/install.sh

ln -sfv ~/my-configs/my-picom/picom.conf ~/.config/picom.conf

mkdir -pv ~/.config/ranger
ln -sfv ~/my-configs/my-ranger/rc.conf ~/.config/ranger/rc.conf
ln -sfv ~/my-configs/my-ranger/scope.sh ~/.config/ranger/scope.sh

mkdir -pv ~/.vim/snippets
ln -sfv ~/my-configs/my-snippets/_.snippets ~/.vim/snippets/_.snippets

ln -sfv ~/my-configs/my-vimrc/.vimrc-linux ~/.vimrc
