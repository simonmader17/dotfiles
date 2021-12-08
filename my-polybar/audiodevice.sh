#!/bin/bash

# pacmd list-sinks | grep "* index" -A1 | grep "name" | cut -d "." -f 2 | cut -c 1-10 | awk '{print $1"..."}'
pacmd list-sinks | grep "* index" -A70 | grep "alsa.long_card_name" | cut -d "\"" -f 2 | cut -c 1-13 | awk '{print $0"..."}'
