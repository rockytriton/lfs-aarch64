#!/bin/bash
set -e

pck=$1
ver=$2

cd /
tar -xhf ${LFS_BIN_DIR:?}/$pck-$ver-pck.txz
