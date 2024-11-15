#!/bin/bash

set -e

if is_installed "tools_bison" ; then
    echo "Skipping tools_bison (already installed)"
    exit 0
fi

prep_build "$1"

./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.8.2
make
make install

set_installed "tools_bison"
