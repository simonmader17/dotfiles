#!/bin/bash

current_in=$(hyprctl getoption general:gaps_in | awk 'NR==2{print $2}')
current_out=$(hyprctl getoption general:gaps_out | awk 'NR==2{print $2}')

new_in=$(($current_in + 5))
new_out=$(($current_out + 5))

[ "$new_in" -gt 100 ] && new_in=100
[ "$new_out" -gt 100 ] && new_out=100

hyprctl --batch "keyword general:gaps_in $new_in"
hyprctl --batch "keyword general:gaps_out $new_out"
