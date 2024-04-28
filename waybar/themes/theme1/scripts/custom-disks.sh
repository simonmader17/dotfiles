#!/bin/bash
echo
~/dotfiles/scripts/my-disks.sh | while read line; do
	echo -n "$line\r"
done
