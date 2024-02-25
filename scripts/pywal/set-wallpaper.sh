#!/bin/bash
dunstify -h string:x-dunst-stack-tag:wallpaper-setter -i ~/dotfiles/scripts/pywal/pywal-icon.png "Wallpaper Setter" "Setting \"$1\" as wallpaper..."
wal -i "$1" --backend colorz -o ~/dotfiles/scripts/pywal/post-pywal.sh |
while read -r line; do
	dunstify -h string:x-dunst-stack-tag:wallpaper-setter -i ~/dotfiles/scripts/pywal/pywal-icon.png "Wallpaper Setter" "${line##*: }"
done

# On wayland
# if type swww; then
# 	pgrep swww || swww init
# 	swww img "$1"
# fi

if [ "${PIPESTATUS[0]}" = 0 ]
then dunstify -h string:x-dunst-stack-tag:wallpaper-setter -i ~/dotfiles/scripts/pywal/pywal-icon.png "Wallpaper Setter" "Successfully set wallpaper."
else dunstify -h string:x-dunst-stack-tag:wallpaper-setter -i ~/dotfiles/scripts/pywal/pywal-icon.png -u critical "Wallpaper Setter" "Failed to set wallpaper."
fi
