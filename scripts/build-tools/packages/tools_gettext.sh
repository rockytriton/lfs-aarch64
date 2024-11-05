#!/bin/bash

set -e

if is_installed "tools_gettext" ; then
    echo "Skipping tools_gettext (already installed)"
    exit 0
fi

prep_build "$1"

./configure --disable-shared
make
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin

set_installed "tools_gettext"
