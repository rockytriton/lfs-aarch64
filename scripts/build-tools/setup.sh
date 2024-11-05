#!/bin/bash

export BUILD_SCRIPT_DIR=$(pwd)

echo "Building tools in ${LFS:?}"

. ./utils.sh

( set -e 

if ! is_installed "pre-setup" ; then
    bash -e lfs-pre-setup.sh
else
    echo "Skipping pre-setup"
fi

cp -r $BUILD_SCRIPT_DIR $LFS/usr/share/lfs/setup

if ! is_installed "build-tools-lfs" ; then
    chown -vR lfs $LFS/usr/share/lfs/setup

    sudo -u lfs ./build-tools.sh

    chown --from lfs -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools,lib64}

    mkdir -pv $LFS/{dev,proc,sys,run}

    set_installed "build-tools-lfs"
else
    echo "Skipping build-tools-lfs"
fi

v_mount

if ! is_installed "build-tools-chroot" ; then
    chown -R root:root $LFS/usr/share/lfs/setup
    chmod u+x $LFS/usr/share/lfs/setup/build-tools/packages/*.sh

    do_chroot_build "init_setup"
    do_chroot_build "tools_gettext" "gettext-0.22.5.tar.xz"
    do_chroot_build "tools_bison" "bison-3.8.2.tar.xz"
    do_chroot_build "tools_perl" "perl-5.40.0.tar.xz"
    do_chroot_build "tools_python" "Python-3.12.5.tar.xz"
    do_chroot_build "tools_texinfo" "texinfo-7.1.tar.xz"
    do_chroot_build "tools_utillinux" "util-linux-2.40.2.tar.xz"
    do_chroot_build "tools_cleanup"

    #set_installed "build-tools-chroot"
else
    echo "Skipping build-tools-chroot"
fi


echo "Done"
)

v_umount
