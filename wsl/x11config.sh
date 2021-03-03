#!/usr/bin/env bash

# install see https://medium.com/@ragin/development-under-windows-under-linux-with-wsl2-intellij-860daf601b61
sudo apt install libcups2 libpangocairo-1.0-0 libatk-adaptor libxss1 libnss3 libxcb-keysyms1 x11-apps libgbm1

# in .bashrc
export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
export LIBGL_ALWAYS_INDIRECT=1

# See https://stackoverflow.com/questions/61110603/how-to-set-up-working-x11-forwarding-on-wsl2
