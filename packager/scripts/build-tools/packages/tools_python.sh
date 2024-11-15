#!/bin/bash

set -e

if is_installed "tools_python" ; then
    echo "Skipping tools_python (already installed)"
    exit 0
fi

prep_build "$1"

./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip

make
make install

set_installed "tools_python"
