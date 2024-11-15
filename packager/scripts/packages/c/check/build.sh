
./configure --prefix=/usr --disable-static 
make
make DESTDIR=$LFS_PCK_DIR docdir=/usr/share/doc/check-0.15.2 install

