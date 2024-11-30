
./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --with-extra-only \
            --with-gtk=no     \
            --disable-static
make
make DESTDIR=$LFS_PCK_DIR install

