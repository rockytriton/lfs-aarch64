#!/bin/bash
mkdir -pv $LFS_PCK_DIR/{etc,var,dev,proc,sys,run,root,home} $LFS_PCK_DIR/usr/{bin,lib,sbin,lib64}

for i in bin lib sbin; do
    ln -sv usr/$i $LFS_PCK_DIR/$i
done
