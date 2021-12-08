#!/bin/bash

pacmd list-sinks | grep "* index" -A1 | grep "name" | cut -d "." -f 2 | cut -c 1-10 | awk '{print $1"..."}'
