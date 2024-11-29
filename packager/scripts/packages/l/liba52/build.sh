./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --enable-shared         \
            --disable-static        \
            CFLAGS="${CFLAGS:--g -O3} -fPIC" 
make
make DESTDIR=$LFS_PCK_DIR install

mkdir -p $LFS_PCK_DIR/usr/include/a52dec

cp liba52/a52_internal.h $LFS_PCK_DIR/usr/include/a52dec 
install -v -m644 -D doc/liba52.txt \
    $LFS_PCK_DIR/usr/share/doc/liba52-0.8.0/liba52.txt
