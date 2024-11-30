
autoreconf -fiv              
./configure --prefix=/usr    \
            --enable-jpeg    \
            --enable-jasper  \
            --enable-lcms    \
            --disable-static \
            --docdir=/usr/share/doc/libraw-0.21.2
make
make DESTDIR=$LFS_PCK_DIR install

