
autoreconf -fiv                                  
LINKS="/usr/bin/links" ./configure --prefix=/usr

make
make DESTDIR=$LFS_PCK_DIR install

