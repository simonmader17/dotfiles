#!/bin/bash

# Add transparency to color0
color0="$(xrdb -get color0)"
echo "*color0transparent: ${color0:0:1}AA${color0:1}" >> ~/.cache/wal/colors.Xresources
xrdb -merge ~/.cache/wal/colors.Xresources

WALLPAPER="$(cat ~/.cache/wal/colors.json | jq ".wallpaper" -r)"

# Update betterlockscreen image
betterlockscreen -u "$WALLPAPER" --fx

# Link /usr/share/Pictures/lockscreen to wallpaper
ln -sf "$WALLPAPER" /mnt/d/Wallpaper/lockscreen
