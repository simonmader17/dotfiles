#!/bin/bash
ip_route=$(ip route get 8.8.8.8)
if [[ "$ip_route" == *"Network is unreachable"* ]]; then
	echo "󰤣 Not connected"
	exit
fi

interface=$(echo "$ip_route" | awk -- '{printf $5}')
ip_addr=$(echo "$ip_route" | awk -- '{printf $7}')
current=$(cat ~/dotfiles/polybar/my-network/current)
if [[ "$current" == "<Show IP>" ]]; then
	echo "$ip_addr" > ~/dotfiles/polybar/my-network/current
else
	echo "<Show IP>" > ~/dotfiles/polybar/my-network/current
fi
