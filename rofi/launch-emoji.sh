#!/bin/bash
# grep -v "^#" ~/dotfiles/rofi/emoji-data.txt | grep "emoji" | sed "s/.*(\(.*\)) \(.*\)/\1: \2/" | tr "[:upper:]" "[:lower:]" | ~/dotfiles/rofi/launch-dmenu.sh | cut -d ":" -f 1 | wl-copy -n
grep -v "^#" ~/dotfiles/rofi/emoji-test.txt | grep "fully-qualified" | sed "s/.*# \(.*\)/\1/" | cut -d " " -f 1,3- | ~/dotfiles/rofi/launch-dmenu.sh | cut -d " " -f 1 | wl-copy -n
