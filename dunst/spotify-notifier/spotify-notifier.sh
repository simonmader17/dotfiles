#!/bin/bash

# This icon cache maps a requested album art url to the tmp file that contains
# the album art if it has already been requested. But the 3 different follow
# processes have independent caches as they are different processes. Possible
# solution: using shared memory and semaphores (TODO)
declare -A icon_cache

rm_cached_files() {
	echo "Removing cached files"
	for cached_file in "${icon_cache[@]}"
	do
		# rm -v "$cached_file"
		echo "$cached_file" # Not working TODO
	done
}

trap rm_cached_files SIGINT

send_notification() {
	if playerctl --player=spotify status; then
		title=$(playerctl --player=spotify metadata title)
		artist=$(playerctl --player=spotify metadata artist)
		album=$(playerctl --player=spotify metadata album)
		let volume=$(echo "$(playerctl --player=spotify volume) * 100 / 1" | bc)

		iconurl=$(playerctl --player=spotify metadata mpris:artUrl)
		if [ -z "$iconurl" ]; then
			icon="/usr/share/Pictures/spotify-black.png"
		else
			if [ -z "${icon_cache["$iconurl"]}" ]; then
				# if iconurl is not in the cache
				iconfile=$(mktemp)
				curl "$iconurl" > "$iconfile"
				icon_cache["$iconurl"]="$iconfile"
				echo "$iconurl not in cache, created $iconfile."
			else
				iconfile="${icon_cache["$iconurl"]}"
				echo "Found $iconurl in cache: $iconfile."
				fi
				icon="$iconfile"
			fi

			dunstify -a Spotify -h string:x-dunst-stack-tag:spotify-notifier -i "$icon" "$1$title" "$artist\nAlbum: <i>$album</i>" -h "int:value:$volume"
			maim --window $(xdotool search --class "Dunst") | xclip -selection clipboard -t image/png
		fi
}

follow_status() {
	playerctl --player=spotify --follow status |
	while read line; do
		if [ "$line" = "Playing" ]; then
			send_notification " "
		else
			send_notification " "
		fi
	done
}

follow_title() {
	playerctl --player=spotify --follow metadata title |
	while read line; do
		send_notification
	done
}

follow_volume() {
	playerctl --player=spotify --follow volume |
	while read line; do
		send_notification
	done
}

follow_status &
follow_title &
follow_volume
