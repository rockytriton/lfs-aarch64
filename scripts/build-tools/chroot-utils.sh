#!/bin/bash
export LFS="/"
export STAT_PATH=${LFS:?}/usr/share/lfs/installed
export MAKEFLAGS="-j$(nproc)"


if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f /etc/profile ]; then
    source /etc/profile
    echo "Init profile"
fi
