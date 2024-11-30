
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/libqalculate-5.2.0
make
make DESTDIR=$LFS_PCK_DIR install

rm -v $LFS_PCK_DIR/usr/lib/libqalculate.la
