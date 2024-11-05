#!/bin/bash

set -e

if is_installed "tools_texinfo" ; then
    echo "Skipping tools_texinfo (already installed)"
    exit 0
fi

prep_build "$1"
build_dir=$(pwd)

./configure --prefix=/usr
make
make install

cd /sources
rm -rf $build_dir

set_installed "tools_texinfo"
