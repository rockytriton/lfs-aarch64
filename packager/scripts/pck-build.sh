#!/bin/bash

set -e

source ./util.sh
source ./env.sh

mkdir -p $LFS_BIN_DIR


pck=${1:?}
pckpath=packages/${pck:0:1}/$pck
pckfile=packages/${pck:0:1}/$pck/info.yml

echo "Ran pck-build.sh $1 - $pck"

if ! test -f $pckfile; then
    echo "Package not found!"
    exit -1
fi

if is_installed $pck ; then
    echo "Package installed"
    exit 0
fi

deps=($(pck-read $pckfile dependencies))

num_deps=${#deps[@]}

echo "PCK1: $pck"

if (( $num_deps > 0 )); then
    echo "Checking dependencies: ${#deps[@]}"

    install_deps=()

    echo "PCK2: $pck"

    for dep in "${deps[@]}"
    do
        if ! is_installed $dep ; then
            echo "$dep not installed"
            install_deps+=($dep)
        fi
    done;

    echo "PCK3: $pck"

    num_deps=${#install_deps[@]}
    if (( $num_deps > 0 )); then
        echo "Need to install ${install_deps[@]}"

        for dep in "${install_deps[@]}"
        do
            echo "Installing: $dep"
            bash pck-build.sh $dep
        done;
    fi
    echo "PCK4: $pck"
fi

sleep 1

rm -rf ${LFS_PCK_DIR:?}
mkdir -p $LFS_PCK_DIR

echo "PCK5: $pck"

url=$(pck-read $pckfile source)
ver=$(pck-read $pckfile version)

if [ "$ver" == "" ]; then
    echo "Invalid Version!"
    exit -1
fi

echo "About to install $pck - $ver - $url"

bash -e build-package.sh $pck $url

echo "Package build complete, creating package file..."

bash -e pck-package.sh $pck $ver

echo "Installing package..."

bash -e pck-install.sh $pck $ver

echo $pck >> /usr/share/lfs/installed

echo "Marked package installed: $pck"
