
rm -v man3/crypt*
make DESTDIR=$LFS_PCK_DIR prefix=/usr install
