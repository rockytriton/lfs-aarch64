
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/libogg-1.3.5 
make
make DESTDIR=$LFS_PCK_DIR install

