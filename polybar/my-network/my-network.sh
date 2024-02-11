#!/bin/bash
local_interface=$(route | awk '/^default/{print $NF}')
if [ -z "$local_interface" ]; then
	echo "󰤣 Not connected"
else
	cat ~/dotfiles/polybar/my-network/current
fi
