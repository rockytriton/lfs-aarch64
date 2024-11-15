
./configure --prefix=/usr --sysconfdir=/etc                               \
            --disable-static                                \
            --disable-gssapi
make
make DESTDIR=$LFS_PCK_DIR install

