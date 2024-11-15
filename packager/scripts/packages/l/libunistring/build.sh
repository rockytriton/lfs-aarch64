
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/libunistring-1.2
make
make DESTDIR=$LFS_PCK_DIR install

