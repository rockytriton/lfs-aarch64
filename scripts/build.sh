#!/bin/bash
BUNDLE=$1

RUNROOT=$RUNROOT

set -e

if [ "$RUNROOT" == "1" ]; then
    echo "Installing in root"
else
    if [ "$(stat -c %d:%i /)" == "$(stat -c %d:%i /proc/1/root/)" ]; then
        echo "Not in a chroot environment!"

        mount=$(df | grep "${LFS}$" | awk '{print $1}')

        if [ "$mount" == "" ]; then
            echo "${LFS:?} not mounted"
            exit -1
        fi


        read -p "Change to chroot ${LFS:?}? (y/n): " answer

        if [ "$answer" == "y" ]; then
            echo "OK"
            mkdir -p $LFS/usr/share/lfs/scripts/
            cp -r ./* $LFS/usr/share/lfs/scripts/
            ./run-in-chroot.sh build.sh $1
        else
            exit -1
        fi

        exit 0
    fi
fi

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

    echo "Marked package installed: $pck"
    
done <<< "$lines"

echo "Build All Complete"
