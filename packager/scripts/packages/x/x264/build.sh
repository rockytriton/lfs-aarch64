./configure --prefix=/usr \
            --enable-shared \
            --disable-cli 
make
make DESTDIR=$LFS_PCK_DIR install

