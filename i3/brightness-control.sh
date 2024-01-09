#!/bin/bash
# Usage: ./brightness-control.sh { up | down }

icon_high="display-brightness-high-symbolic"
icon_medium="display-brightness-medium-symbolic"
icon_low="display-brightness-low-symbolic"

function get_brightness {
	echo $(($(brightnessctl g) * 100 / $(brightnessctl m)))
}

function send_notification {
	brightness=$(($(get_brightness)))
	if [ "$brightness" -ge 70 ]; then
		icon="$icon_high"
	elif [ "$brightness" -ge 30 ]; then
		icon="$icon_medium"
	else
		icon="$icon_low"
	fi
	bar=$(seq -s "─" 0 $((brightness / 5)) | sed 's/[0-9]//g')
	dunstify -r 5555 -h string:x-dunst-stack-tag:brightness -i "$icon" "$bar"
}

case $1 in
	up)
		brightnessctl -q set +5%
		send_notification
		;;
	down)
		brightnessctl -q set 5%-
		send_notification
		;;
esac
