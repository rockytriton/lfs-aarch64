
make prefix=/usr
make DESTDIR=$LFS_PCK_DIR prefix=/usr install
rm -v $LFS_PCK_DIR/usr/lib/libzstd.a
