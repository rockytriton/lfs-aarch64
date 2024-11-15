#!/bin/bash

set -e

if is_installed "tools_cleanup" ; then
    echo "Skipping tools_cleanup (already installed)"
    exit 0
fi

rm -rf /usr/share/{info,man,doc}/*
find /usr/{lib,libexec} -name \*.la -delete
rm -rf /tools

set_installed "tools_cleanup"
