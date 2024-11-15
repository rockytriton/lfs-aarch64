
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/libxslt-1.1.42
make
make DESTDIR=$LFS_PCK_DIR install

