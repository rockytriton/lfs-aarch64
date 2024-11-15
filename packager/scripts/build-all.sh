#!/bin/bash

set -e

mkdir -p /usr/share/lfs

source ./env.sh

echo "Prefix: $XORG_PREFIX"

while read -r line
do
    fields=($line)
    pck=${fields[0]}
    url=${fields[1]}

    if [[ $pck == \#* ]]; then
        #echo "Skipping $pck"
        continue
    fi

    if grep -Fx $pck /usr/share/lfs/installed; then
        echo "Skipping $pck (already installed)"
        continue
    fi

    echo "Processing: $pck..."

    bash -e build-package.sh $pck $url

    echo $pck >> /usr/share/lfs/installed
done < "package-list.txt"

echo "Build All Complete"
