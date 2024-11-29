
./configure --prefix=/usr --disable-static  --disable-tester
make
make DESTDIR=$LFS_PCK_DIR install

