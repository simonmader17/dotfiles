#!/bin/bash

if [ -z $1 ]; then
	theme_name=default
else
	theme_name=$1
fi

echo "$theme_name.json"

wal --theme "$HOME/dotfiles/themes/$theme_name.json" -o "$HOME/dotfiles/scripts/post-pywal.sh"
