#!/bin/bash
if sss \
	--notify \
	--area "$(my-slop)" \
	--background "$(xrdb -get background)" \
	--author-color "$(xrdb -get color7)" \
	--fonts "CaskaydiaCove Nerd Font=18.0;" \
	--author-font "CaskaydiaCove Nerd Font" \
	--shadow --shadow-image \
	--window-title "$1" \
	--window-controls \
	--window-background "#313131" \
	--window-title-color "$(xrdb -get color7)" \
	-o "/mnt/d/Fotos/sss/$(date "+%Y-%m-%d_%H-%M-%S").png"
then
	nautilus /mnt/d/Fotos/sss/
fi
