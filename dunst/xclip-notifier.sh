#!/bin/bash

# kill running program instances
# killall xclip-notifier.sh

prev_content=$(xclip -o -selection clipboard)

while clipnotify; do
	content=$(xclip -o -selection clipboard)
	if [ "$content" != "$prev_content" ]; then
		dunstify -h string:x-dunst-stack-tag:xclip-notifier -a xclip-notifier -i "accessories-clipboard" -u low "Copied text to clipboard" "$content"
	fi
	prev_content="$content"
done
