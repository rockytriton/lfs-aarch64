#!/bin/bash

set -e

source ./util.sh
source ./env.sh

mkdir -p $LFS_BIN_DIR

pck=${1:?}
pckpath=packages/${pck:0:1}/$pck
pckfile=packages/${pck:0:1}/$pck/info.yml

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

if (( $num_deps > 0 )); then
    echo "Checking dependencies: ${#deps[@]}"

    install_deps=()

    for dep in "${deps[@]}"
    do
        if ! is_installed $dep ; then
            echo "$dep not installed"
            install_deps+=($dep)
        fi
    done;

    num_deps=${#install_deps[@]}
    if (( $num_deps > 0 )); then
        echo "Need to install ${install_deps[@]}"

        for dep in "${install_deps[@]}"
        do
            echo "Installing: $dep"
            bash pck-installer.sh $dep
        done;
    fi
    
fi

sleep 1

rm -rf ${LFS_PCK_DIR:?}
mkdir -p $LFS_PCK_DIR

url=$(pck-read $pckfile source)
ver=$(pck-read $pckfile version)

if [ "$ver" == "" ]; then
    echo "Invalid Version!"
    exit -1
fi

echo "Installing package..."

bash -e pck-install.sh $pck $ver

echo $pck >> /usr/share/lfs/installed

echo "Marked package installed: $pck"
