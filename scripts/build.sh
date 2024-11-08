#!/bin/bash
BUNDLE=$1

set -e

echo "Building bundle ${BUNDLE:?}"

mkdir -p /usr/share/lfs

source ./env.sh

lines=$(./read-package.sh $BUNDLE)

while read -r line
do
    fields=($line)
    pck=${fields[0]}
    url=${fields[1]}

    if [[ $pck == \#* ]]; then
        continue
    fi

    if grep -Fx $pck /usr/share/lfs/installed; then
        echo "Skipping $pck (already installed)"
        continue
    fi

    echo "Processing: $pck..."

    bash -e build-package.sh $pck $url

    echo $pck >> /usr/share/lfs/installed
done <<< "$lines"

echo "Build All Complete"
