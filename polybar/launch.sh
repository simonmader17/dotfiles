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

primary=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
others=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)
monitors=(${primary[@]} ${others[@]})
echo ${monitors[@]}

largeMonitorExists=false

if type "xrandr"; then
	# Check if large monitor exists
	for m in ${monitors[@]}; do
		if [[ "$(xrandr --query | grep $m)" == *"2560x1440"* ]]; then
			largeMonitorExists=true
		fi
	done
	for m in ${monitors[@]}; do
		if [[ "$(xrandr --query | grep $m)" == *"2560x1440"* ]]; then
			MONITOR=$m polybar --reload top &
		else
			MONITOR=$m polybar --reload top-small &
			# if [ "$largeMonitorExists" = false ]; then
				MONITOR=$m polybar --reload bottom-small &
			# fi
		fi
		if [[ "$m" == "$primary" ]]; then
			sleep 1 # Wait for primary monitor to grab the tray
		fi
	done
else
	polybar --reload top &
fi
