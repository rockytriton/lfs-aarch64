#!/bin/bash

set -e

source ./util.sh
source ./env.sh

pck=${1:?}
pckpath=packages/${pck:0:1}/$pck
pckfile=packages/${pck:0:1}/$pck/info.yml

if ! test -f $pckfile; then
    echo "Package not found!"
    exit -1
fi

if is_installed $pck ; then
    echo "Package installed"
fi

deps=($(pck-read $pckfile dependencies))

num_deps=${#deps[@]}

if (( $num_deps > 0 )); then
    echo "Checking dependencies: ${#deps[@]}"

    install_deps=()

    for dep in "${deps[@]}"
    do
        if ! is_installed $pck ; then
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
            bash pck-build.sh $dep
        done;
    fi
fi

