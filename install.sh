#!/bin/bash

makepkg -f
ls -t nemo-ybnd-personal* | head -1 | xargs -I $ sudo pacman -U --noconfirm $
sudo rm -r nemo