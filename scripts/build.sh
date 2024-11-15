#!/bin/bash
BUNDLE=$1

RUNROOT=$RUNROOT

export LFS_PCK_DIR=/tmp/pckdir
export LFS_BIN_DIR=/usr/share/lfs/bin

mkdir -p $LFS_BIN_DIR

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
    ver=${fields[2]}

    if [[ $pck == \#* ]]; then
        continue
    fi

    if grep -Fx $pck /usr/share/lfs/installed; then
        echo "Skipping $pck (already installed)"
        continue
    fi

    echo "Processing: $pck..."

    rm -rf ${LFS_PCK_DIR:?}
    mkdir -p $LFS_PCK_DIR

    bash -e build-package.sh $pck $url

    echo "Package build complete, creating package file..."

    bash -e create-package.sh $pck $ver

    echo "Installing package..."
    
    bash -e install-package.sh $pck $ver

    echo $pck >> /usr/share/lfs/installed

    echo "Marked package installed: $pck"
    
done <<< "$lines"

echo "Build All Complete"
