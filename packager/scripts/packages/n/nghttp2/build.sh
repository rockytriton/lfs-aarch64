
./configure --prefix=/usr     \
            --disable-static  \
            --enable-lib-only \
            --docdir=/usr/share/doc/nghttp2-1.62.1
make
make DESTDIR=$LFS_PCK_DIR install

