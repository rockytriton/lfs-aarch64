./configure --prefix=/usr          \
            --disable-static       \
            --with-gcc-arch=native
make
make DESTDIR=$LFS_PCK_DIR install

