
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/expat-2.6.2
make
make DESTDIR=$LFS_PCK_DIR install

