#!/bin/bash
if sss \
	--area "0,0 1920x1080" \
	--background "$(xrdb -get background)" \
	--author-color "$(xrdb -get color7)" \
	--fonts "CaskaydiaCove Nerd Font=18.0;" \
	--author-font "CaskaydiaCove Nerd Font" \
	--shadow --shadow-image \
	-o "/mnt/d/Fotos/sss/$(date "+%Y-%m-%d_%H-%M-%S").png"
then
	nautilus /mnt/d/Fotos/sss/
fi
