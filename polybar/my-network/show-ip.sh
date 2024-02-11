#!/bin/bash
local_interface=$(route | awk '/^default/{print $NF}')
if [ -z "$local_interface" ]; then
	exit
fi
local_ip=$(ip addr show "$local_interface" | grep -w "inet" | awk '{ print $2; }' | sed 's/\/.*$//')
current=$(cat ~/dotfiles/polybar/my-network/current)
if [ "$current" = "<Show IP>" ]; then
	echo "$local_ip" > ~/dotfiles/polybar/my-network/current
else
	echo "<Show IP>" > ~/dotfiles/polybar/my-network/current
fi
