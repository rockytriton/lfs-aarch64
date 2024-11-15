
./configure --prefix=/usr --disable-static
make
make DESTDIR=$LFS_PCK_DIR install

