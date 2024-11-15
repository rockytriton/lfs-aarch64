
./configure --prefix=/usr --disable-static   --enable-libgdbm-compat
make
make DESTDIR=$LFS_PCK_DIR install

