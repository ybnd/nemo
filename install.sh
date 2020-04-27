#!/bin/bash

makepkg -f
ls -t nemo-ybnd-personal* | head -1 | xargs -I $ sudo pacman -U --noconfirm $
sudo rm -r nemo
echo $'\n'


# Prompt to reset changes
#    -> version is updated ~ makepkg
#		not something that I want to have in the history if it's not necessary 
git diff
echo $'\n'

while [ 1 ]
do
	read -p $'git reset --hard? (y/n) ' -n 1 choice

	case "$choice" in 
		y|Y )
			echo $'\n'
			git reset --hard
			break
			;;
		n|N ) 
			break
			;;
	esac
done

echo $'\n'

