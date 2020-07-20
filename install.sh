#!/bin/bash


# Handle -y flag to 
force_git_reset=0

while getopts 'y' opt; do
    case $opt in 
        y) force_git_reset=1 ;;
    esac
done

# Check out personal branch & merge origin/master
git checkout personal
git merge origin/master

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
    if [ $force_git_reset -eq 1 ]; then
        choice="y"
    else
        read -p $'git reset --hard? (y/n) ' -n 1 choice
    fi	

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

