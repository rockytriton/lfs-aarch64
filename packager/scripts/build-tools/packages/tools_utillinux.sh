#!/bin/bash

set -e

if is_installed "tools_utillinux" ; then
    echo "Skipping tools_utillinux (already installed)"
    exit 0
fi

prep_build "$1"
build_dir=$(pwd)

mkdir -pv /var/lib/hwclock

./configure --libdir=/usr/lib     \
            --runstatedir=/run    \
            --disable-chfn-chsh   \
            --disable-login       \
            --disable-nologin     \
            --disable-su          \
            --disable-setpriv     \
            --disable-runuser     \
            --disable-pylibmount  \
            --disable-static      \
            --disable-liblastlog2 \
            --without-python      \
            ADJTIME_PATH=/var/lib/hwclock/adjtime \
            --docdir=/usr/share/doc/util-linux-2.40.2

make
make install

cd /sources
rm -rf $build_dir


set_installed "tools_utillinux"
