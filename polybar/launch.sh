#!/bin/bash

# # Terminate already running bar instances
# killall -q polybar
# 
# # Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# 
# # Launch bar1 and bar2
# MONITORS=$(xrandr --query | grep " connected" | cut -d" " -f1)
# 
# MONITORS=$MONITORS polybar top

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

sleep 1

if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		if [[ "$(xrandr --query | grep $m)" == *"2560x1440"* ]]; then
			MONITOR=$m polybar --reload top &
		else
			MONITOR=$m polybar --reload top-small &
		fi
	done
else
	polybar --reload top &
fi
