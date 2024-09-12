#!/bin/bash

waybar_theme="theme1"

function waybar() {
	echo "Launching waybar"
	command waybar \
		-c "$HOME/dotfiles/waybar/themes/$waybar_theme/config" \
		-s "$HOME/dotfiles/waybar/themes/$waybar_theme/style.css"
}

if pgrep -x waybar; then
	# killall -ew waybar && waybar
	killall -ew waybar
else
	waybar
fi
