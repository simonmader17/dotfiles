#!/bin/bash

# Add transparency to background and color6
# dunstify -h string:x-dunst-stack-tag:wallpaper-setter -i ~/dotfiles/scripts/pywal/pywal-icon.png "Wallpaper Setter" "Adding transparency to background for Polybar."
background="$(xrdb -get background)"
echo "*background-transparent: ${background:0:1}AA${background:1}" >> ~/.cache/wal/colors.Xresources
color6="$(xrdb -get color6)"
echo "*color6-transparent: ${color6:0:1}CC${color6:1}" >> ~/.cache/wal/colors.Xresources
xrdb -merge ~/.cache/wal/colors.Xresources

WALLPAPER="$(cat ~/.cache/wal/colors.json | jq ".wallpaper" -r)"

# On wayland
if type swww; then
	pgrep swww || swww init
    swww img --transition-type outer --transition-pos 0.854,0.977 --transition-step 90 "$WALLPAPER"
fi
if type waybar; then
	~/dotfiles/hypr/scripts/restart-waybar.sh
fi

# Update betterlockscreen background
# dunstify -h string:x-dunst-stack-tag:wallpaper-setter -i ~/dotfiles/scripts/pywal/pywal-icon.png "Wallpaper Setter" "Updating betterlockscreen background."
betterlockscreen -u "$WALLPAPER" --fx

# Link /usr/share/Pictures/lockscreen to wallpaper
# dunstify -h string:x-dunst-stack-tag:wallpaper-setter -i ~/dotfiles/scripts/pywal/pywal-icon.png "Wallpaper Setter" "Linking lockscreen image to wallpaper."
ln -sf "$WALLPAPER" /mnt/d/Wallpaper/lockscreen

# Generate chromium theme
# dunstify -h string:x-dunst-stack-tag:wallpaper-setter -i ~/dotfiles/scripts/pywal/pywal-icon.png "Wallpaper Setter" "Generating chromium theme."
~/sources/ChromiumPywal/generate-theme.sh
ln -sf ~/sources/ChromiumPywal/Pywal ~/00-CHROMIUM-PYWAL-QUICK-ACCESS
