#!/bin/bash
set -e

inst_pck=$1
int_ver=$2

pckinstallfile=packages/${inst_pck:0:1}/$inst_pck/install

if test -d $pckinstallfile; then
    echo "Copying installer file..."
    cp -r $pckinstallfile $LFS_PCK_DIR/
fi

tar -cJpf ${LFS_BIN_DIR:?}/$inst_pck-$int_ver-pck.txz -C $LFS_PCK_DIR .

