set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

source $HOME/.config/nvim/plug-config/coc.vim
luafile $HOME/.config/nvim/treesitter.lua
