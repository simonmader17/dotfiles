#!/bin/bash

waybar_theme="dwm"

function waybar() {
	echo "Launching waybar"
	command waybar \
		-c "$HOME/dotfiles/waybar/themes/$waybar_theme/config" \
		-s "$HOME/dotfiles/waybar/themes/$waybar_theme/style.css"
}

if pgrep -x waybar; then
	killall -ew waybar && waybar
else
	waybar
fi
