#!/bin/bash
color0=$(xrdb -get color0)
echo "*color0transparent: ${color0:0:1}AA${color0:1}" >> ~/.cache/wal/colors.Xresources
xrdb -merge ~/.cache/wal/colors.Xresources
