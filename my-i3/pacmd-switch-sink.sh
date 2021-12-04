#!/bin/bash

SPEAKER_INDEX=$(pacmd list-sinks | grep -m1 -B1 "analog-stereo" | grep "index" | cut -d":" -f2 | cut -d" " -f2)
HEADSET_INDEX=$(pacmd list-sinks | grep -m1 -B1 "usb-Logitech_G433_Gaming_Headset" | grep "index" | cut -d":" -f2 | cut -d" " -f2)

echo $SPEAKER_INDEX
echo $HEADSET_INDEX

if pacmd list-sinks | grep -m1 -B1 "analog-stereo" | grep -q "* index";
then
	# If speaker is selected, switch to headset
	pacmd set-default-sink $HEADSET_INDEX
else
	# Else, switch to speaker
	pacmd set-default-sink $SPEAKER_INDEX
fi
