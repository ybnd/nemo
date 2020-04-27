#!/bin/bash
sudo rm -r nemo
makepkg -f
ls -t nemo-ybnd-personal* | head -1 | xargs -I $ sudo pacman -U --noconfirm $
