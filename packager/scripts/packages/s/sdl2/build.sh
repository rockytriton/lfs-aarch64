
./configure --prefix=/usr 
make
make DESTDIR=$LFS_PCK_DIR install
rm -v $LFS_PCK_DIR/usr/lib/libSDL2*.a
