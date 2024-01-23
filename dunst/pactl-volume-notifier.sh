#!/bin/bash

icon_overamplified="audio-volume-overamplified-symbolic"
icon_high="audio-volume-high-symbolic"
icon_medium="audio-volume-medium-symbolic"
icon_low="audio-volume-low-symbolic"
icon_muted="audio-volume-muted-symbolic"

prev_volume=""

pactl subscribe |
grep --line-buffered " sink " |
stdbuf -o0 cut -d# -f2 | # -o0 ... unbuffered; stdbuf runs the cut command unbuffered
while read index; do
	volumes=$(pactl get-sink-volume "$index" | grep -Po '\d+(?=%)')
	volume=$(echo "$volumes" | head -n 1) # assuming left and right volumes are equal
	if pactl get-sink-mute "$index" | grep "yes"; then
		volume="0"
	fi
	if [ "$volume" -ge 70 ]; then
		icon="$icon_high"
	elif [ "$volume" -ge 30 ]; then
		icon="$icon_medium"
	else
		icon="$icon_low"
	fi
	urg="low"
	if [ "$volume" = 0 ]; then
		volume="Muted"
		bar=""
		icon="$icon_muted"
	elif [ "$volume" -lt 100 ]; then
		volume=" $volume"
	elif [ "$volume" -gt 100 ]; then
		icon="$icon_overamplified"
		urg="critical"
	fi
	if [ "$volume" != "Muted" ]; then
		volume="$volume%"
	fi
	if [ "$volume" != "$prev_volume" ]; then
		dunstify -h string:x-dunst-stack-tag:pactl-volume-notifier -u "$urg" -i "$icon" "$volume" -h "int:value:$volume"
		prev_volume="$volume"
	fi
done
