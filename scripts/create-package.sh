#!/bin/bash
set -e

pck=$1
ver=$2

tar -cJpf ${LFS_BIN_DIR:?}/$pck-$ver-pck.txz -C $LFS_PCK_DIR .

