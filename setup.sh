#!/bin/bash

mkdir -pv ~/.config

# GTK+ config
ln -sfv ~/dotfiles/gtkrc-2.0/.gtkrc-2.0 ~/.gtkrc-2.0

# Alacritty
mkdir -pv ~/.config/alacritty
ln -sfv ~/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# .bashrc
ln -sfv ~/dotfiles/bashrc/.bashrc ~/.bashrc

# fish
mkdir -pv ~/.config/fish/functions
ln -sfv ~/dotfiles/fish/config.fish.sh ~/.config/fish/config.fish
ln -sfv ~/dotfiles/fish/nvm.fish ~/.config/fish/functions/nvm.fish
fish -c fish_vi_key_bindings

# My aliases for bash and fish
mkdir -pv ~/.config/aliases
ln -sfv ~/dotfiles/aliases/.aliases ~/.config/aliases/.aliases

# i3
mkdir -pv ~/.config/i3
ln -sfv ~/dotfiles/i3/i3.config ~/.config/i3/config
ln -sfv ~/dotfiles/i3/pacmd-switch-sink.sh ~/.config/i3/pacmd-switch-sink.sh
ln -sfv ~/dotfiles/i3/pactl-switch-sink.sh ~/.config/i3/pactl-switch-sink.sh

# Polybar + required fonts
git clone https://github.com/gabrielelana/awesome-terminal-fonts ~/Downloads/awesome-terminal-fonts
mkdir -pv ~/.fonts
cp -fv ~/Downloads/awesome-terminal-fonts/build/*.ttf ~/.fonts
cp -fv ~/Downloads/awesome-terminal-fonts/build/*.sh ~/.fonts
cp -fv ~/dotfiles/fonts/FiraCode/*.ttf ~/.fonts
cp -fv ~/dotfiles/fonts/FiraCode/*.otf ~/.fonts
cp -fv ~/dotfiles/fonts/FiraCodeiScript/*.ttf ~/.fonts
cp -fv ~/dotfiles/fonts/FiraCodeiScript/*.otf ~/.fonts
cp -fv ~/dotfiles/fonts/IBMPlexMono/*.ttf ~/.fonts
cp -fv ~/dotfiles/fonts/IBMPlexMono/*.otf ~/.fonts
mkdir -pv ~/.config/fontconfig/conf.d
cp -fv ~/Downloads/awesome-terminal-fonts/config/* ~/.config/fontconfig/conf.d
fc-cache -fv ~/.fonts

git clone https://github.com/powerline/fonts.git ~/Downloads/powerline-fonts
source ~/Downloads/powerline-fonts/install.sh

mkdir -pv ~/.config/polybar
ln -sfv ~/dotfiles/polybar/config ~/.config/polybar/config
ln -sfv ~/dotfiles/polybar/launch.sh ~/.config/polybar/launch.sh
ln -sfv ~/dotfiles/polybar/audiodevice.sh ~/.config/polybar/audiodevice.sh
ln -sfv ~/dotfiles/polybar/nordvpn.sh ~/.config/polybar/nordvpn.sh
ln -sfv ~/dotfiles/polybar/nordvpn_connect.sh ~/.config/polybar/nordvpn_connect.sh

# Picom
ln -sfv ~/dotfiles/picom/picom.conf ~/.config/picom.conf

# Ranger
mkdir -pv ~/.config/ranger
ln -sfv ~/dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sfv ~/dotfiles/ranger/scope.sh ~/.config/ranger/scope.sh

# My vim snippets
mkdir -pv ~/.vim/snippets
ln -sfv ~/dotfiles/snippets/_.snippets ~/.vim/snippets/_.snippets

# .vimrc
ln -sfv ~/dotfiles/vimrc/.vimrc ~/.vimrc

# nvim
mkdir -pv ~/.config/nvim/plug-config
ln -sfv ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sfv ~/dotfiles/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -sfv ~/dotfiles/nvim/plug-config/coc.vim ~/.config/nvim/plug-config/coc.vim
ln -sfv ~/dotfiles/nvim/treesitter.lua ~/.config/nvim/treesitter.lua
