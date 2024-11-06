#!/bin/bash
set -e

pck=$1
url=$2

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f /etc/profile ]; then
    source /etc/profile
fi

. ./extract.sh $url

echo "Building $pck..."
    echo -ne "\033]0;$pck\007"

cmd="bash -e $SCRIPTS_PATH/packages/$pck.sh > lfs_build.log"

if [ "$BUILD_VERBOSE" == "1" ]; then
    if ! bash -e $SCRIPTS_PATH/packages/$pck.sh; then
        echo ""
        echo "Failed to build $1"
        exit -1
    fi
else
    if ! bash -e $SCRIPTS_PATH/packages/$pck.sh > lfs_build.log; then
        echo ""
        echo "Failed to build $1, check $(pwd)/lfs_build.log for more details"
        exit -1
    fi
fi

echo "Build Complete"
cd ..
build_base=$(pwd)
cd ..
echo "Cleaning up build directory..."
rm -rf $build_base
