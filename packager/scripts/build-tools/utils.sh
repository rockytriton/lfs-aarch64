#!/bin/bash

export STAT_PATH=${LFS:?}/usr/share/lfs/installed

export UTILS_LOADED=1

is_installed() {
    if [ "$(grep -Fx $1 $STAT_PATH)" == "$1" ]; then
        return 0
    else
        return 1
    fi
}

set_installed() {
    echo $1 >> $STAT_PATH
}

prep_build() {
    cd $LFS/sources
    filename=$1
    ext_dir=$(tar -tf $filename | head -1 | cut -f1 -d"/")
    tar -xf $filename
    cd $ext_dir
}

build_tool() {
    set -e

    echo "LFS: $LFS"
    echo "LFS_TGT: $LFS_TGT"

    if is_installed "$1" ; then
        echo "Skipping $1 (already installed)"
        return
    fi

    echo "Building tool $1"

    prep_build "$2"
    build_path=$(pwd)

    source $BUILD_SCRIPT_DIR/packages/$1.sh

    cd $LFS/sources
    rm -rf $build_path

    set_installed "$1"
    echo "Marked $1 as installed"
}

v_mount() {
    echo "Mounting Virtual in ${LFS:?}"

    mount -v --bind /dev $LFS/dev 
    mount -vt devpts devpts -o gid=5,mode=0620 $LFS/dev/pts
    mount -vt proc proc $LFS/proc
    mount -vt sysfs sysfs $LFS/sys
    mount -vt tmpfs tmpfs $LFS/run

    if [ -h $LFS/dev/shm ]; then
    mkdir -pv $LFS/$(readlink $LFS/dev/shm)
    fi
}

v_umount() {
    echo "Unmounting Virtual in ${LFS:?}"

    mountpoint -q $LFS/dev/pts && umount $LFS/dev/pts || true
    mountpoint -q $LFS/dev/shm && umount $LFS/dev/shm || true
    umount $LFS/{sys,proc,run,dev} || true

    echo "Unmounting complete"
}

do_chroot_build() { (set -e
    echo -ne "\033]0;$1\007"

    CMD=". /usr/share/lfs/setup/build-tools/utils.sh && . /usr/share/lfs/setup/build-tools/chroot-utils.sh && . /usr/share/lfs/setup/build-tools/packages/$1.sh $2"

    chroot "$LFS" /bin/bash -c "$CMD"
)}

