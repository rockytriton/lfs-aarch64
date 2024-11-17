
sed -r '/INSTALL/{/PCI_IDS|update-pciids /d; s/update-pciids.8//}' \
    -i Makefile

make PREFIX=/usr                \
     SHAREDIR=/usr/share/hwdata \
     SHARED=yes

make DESTDIR=$LFS_PCK_DIR PREFIX=/usr                \
     SHAREDIR=/usr/share/hwdata \
     SHARED=yes                 \
     install install-lib        &&

chmod -v 755 $LFS_PCK_DIR/usr/lib/libpci.so
