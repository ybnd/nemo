#!/bin/bash
ls -t nemo-ybnd-personal* | head -1 | xargs -I $ sudo pacman -U --noconfirm $
