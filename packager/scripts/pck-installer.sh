#!/bin/bash

set -e

INSTPATH=${LFS:?}

source ./util.sh
source ./env.sh

pck=${1:?}
pckpath=packages/${pck:0:1}/$pck
pckfile=packages/${pck:0:1}/$pck/info.yml

if ! test -f $pckfile; then
    echo "Package not found!"
    exit -1
fi

if [ ! -f $LFS/usr/share/lfs/installed ]; then
    mkdir -p $LFS/usr/share/lfs/
    touch $LFS/usr/share/lfs/installed
fi

if [ "$(grep -Fx $pck $LFS/usr/share/lfs/installed)" == "$pck" ] ; then
    echo "Package installed"
    exit 0
fi

deps=($(pck-read/pck-read $pckfile dependencies))

num_deps=${#deps[@]}

if (( $num_deps > 0 )); then
    echo "Checking dependencies: ${#deps[@]}"

    install_deps=()

    for dep in "${deps[@]}"
    do
        if [ ! "$(grep -Fx $dep $LFS/usr/share/lfs/installed)" == "$dep" ] ; then
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

#sleep 1

rm -rf ${LFS_PCK_DIR:?}
mkdir -p $LFS_PCK_DIR

url=$(pck-read/pck-read $pckfile source)
ver=$(pck-read/pck-read $pckfile version)

if [ "$ver" == "" ]; then
    echo "Invalid Version!"
    exit -1
fi

echo "Installing package..."

SCDIR=$(pwd)

cd ${LFS:?}/

rm -rf ${LFS:?}/install
tar -xhf $SCDIR/../../bin/$pck-$ver-pck.txz

if [ -d ./install ]; then
    echo "Need to run installer..."
    $SCDIR/run-in-chroot.sh "bash -e install.sh"
    rm -rf ${LFS:?}/install

fi

echo $pck >> $LFS/usr/share/lfs/installed

echo "Marked package installed: $pck"
