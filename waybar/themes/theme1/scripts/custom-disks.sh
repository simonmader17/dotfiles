#!/bin/bash

total_used=0
total_total=0

echo
~/dotfiles/scripts/my-disks.sh |
{
	while read line; do
		echo -n -e "$line\r"
	
		used=$(echo $line | awk '{print $1}' | numfmt --from=iec-i --suffix=B | tr -d -c 0-9)
		total=$(echo $line | awk '{print $5}' | numfmt --from=iec-i --suffix=B | tr -d -c 0-9)
	
		total_used=$(( $total_used + $used ))
		total_total=$(( $total_total + $total ))
	done
	
	total_used=$(numfmt --to=iec-i --suffix=B $total_used)
	total_total=$(numfmt --to=iec-i --suffix=B $total_total)
	echo -n "In total $total_used used out of $total_total"
}
