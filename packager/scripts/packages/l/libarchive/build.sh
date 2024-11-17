
./configure --prefix=/usr --disable-static  --without-expat
make
make DESTDIR=$LFS_PCK_DIR install

