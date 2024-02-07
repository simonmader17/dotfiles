#!/bin/bash

if [ -z $1 ]; then
	theme_name=default
else
	theme_name=$1
fi

theme_path="$HOME/dotfiles/themes/$theme_name.json"
if [ ! -f "$theme_path" ]; then
	echo "Theme \"$theme_name\" doesn't exist." >&2
	exit 2
fi

wal --theme "$theme_path" -o "$HOME/dotfiles/scripts/post-pywal.sh"
