#!/bin/bash
lsblk -o MOUNTPOINTS | while read line; do
	if [[ $line =~ ^/.*$ ]]; then
		df -h -BGiB "$line" | awk 'NR==2{print $3 " used out of " $2 " on " $6 " (" $5 ")"}'
	fi
done
