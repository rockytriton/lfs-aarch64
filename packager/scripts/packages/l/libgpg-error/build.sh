
./configure --prefix=/usr 
make
make DESTDIR=$LFS_PCK_DIR install
install -v -m644 -D README $LFS_PCK_DIR/usr/share/doc/libgpg-error-1.50/README
