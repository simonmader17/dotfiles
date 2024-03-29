# My ThinkPad T430 Pop OS 22.04 Setup Guide

## Basic programs

```
sudo apt install alacritty fish exa bat vim imagemagick feh
```

## vim-plug

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Open vim and type `:PlugInstall`

## LaTeX

```
sudo apt install texlive-full
```

## Git

Configure global settings:

```
git config --global user.name "simonmader17"
git config --global user.email "mail@simonmader.at"
```

Generate SSH keys:

```
ssh-keygen -t ed25519 -C "mail@simonmader.at"
```

$\Rightarrow$ add public key in GitHub settings

## Clone dotfiles

```
cd ~
git clone git@github.com:simonmader17/dotfiles.git
cd dotfiles
sudo bash ./setup.sh
```
