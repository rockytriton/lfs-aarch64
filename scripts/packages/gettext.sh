
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/gettext-0.22.5
make
make DESTDIR=$LFS_PCK_DIR install

chmod -v 0755 $LFS_PCK_DIR/usr/lib/preloadable_libintl.so
