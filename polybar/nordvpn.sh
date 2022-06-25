#!/bin/bash

if [[ $(nordvpn status | grep "Status: Disconnected") ]]
then
	echo "<Connect to VPN>"
else
	nordvpn status | grep "Status: Connected" -A4 | grep "IP" | cut -d " " -f 3
fi
