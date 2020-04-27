#!/bin/bash

# compile to build/
# can run from build/src/ without full re-install

killall nemo
cd ~/code/nemo/build && ninja && cd src && ./nemo && cd ..
