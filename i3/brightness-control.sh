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
	if [ "$brightness" -lt 100 ]; then
		brightness=" $brightness"
	fi
	dunstify -h string:x-dunst-stack-tag:brightness-control -i "$icon" -u "low" "$brightness%" -h "int:value:$brightness"
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
