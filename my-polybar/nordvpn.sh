#!/bin/bash

nordvpn status | grep "Status: Disconnected" | echo "Disconnected"

nordvpn status | grep "Status: Connected" -A4 | grep "IP" | cut -d " " -f 3
