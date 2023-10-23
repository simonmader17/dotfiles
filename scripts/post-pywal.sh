#!/bin/bash

# Add transparency to color0
color0=$(xrdb -get color0)
echo "*color0transparent: ${color0:0:1}AA${color0:1}" >> ~/.cache/wal/colors.Xresources
xrdb -merge ~/.cache/wal/colors.Xresources

# Link /usr/share/Pictures/lockscreen to wallpaper
ln -sf $(cat ~/.cache/wal/wal) /mnt/d/Wallpaper/lockscreen

# Update betterlockscreen image
betterlockscreen -u /usr/share/Pictures/lockscreen
