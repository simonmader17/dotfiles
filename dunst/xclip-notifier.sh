#!/bin/bash

# kill running program instances
# killall xclip-notifier.sh

if xclip -selection clipboard -o; then
	prev_content=$(xclip -selection clipboard -o)
else
	prev_content=$(xclip -selection clipboard -t image/png -o)
fi

while clipnotify; do
	if xclip -selection clipboard -o; then
		content=$(xclip -selection clipboard -o)
		if [ "$content" != "$prev_content" ]; then
			dunstify -h string:x-dunst-stack-tag:xclip-notifier -a xclip-notifier -r 5556 -i "accessories-clipboard" -u low "Copied text to clipboard" "$content"
		fi
	else
		content=$(xclip -selection clipboard -t image/png -o)
		if [ "$content" != "$prev_content" ]; then
			tmpfile=$(mktemp)
			xclip -selection clipboard -t image/png -o > $tmpfile
			dunstify -h string:x-dunst-stack-tag:xclip-notifier -a xclip-notifier -r 5556 -i $tmpfile -u low "Copied image to clipboard"
		fi
	fi
	prev_content="$content"
done
