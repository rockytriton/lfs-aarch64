
CC=gcc ./configure --prefix=/usr -G -O3 -r
make
make DESTDIR=$LFS_PCK_DIR install

