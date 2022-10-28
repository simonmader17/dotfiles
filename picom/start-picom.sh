killall picom;
if lshw -C display | grep "NVIDIA"; then
	picom -b --backend glx --config ~/dotfiles/picom/high-battery-usage.conf;
else
	picom -b --backend xrender --config ~/dotfiles/picom/low-battery-usage.conf;
fi
