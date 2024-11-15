
./configure --prefix=/usr --disable-static   \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.5.2
make
make DESTDIR=$LFS_PCK_DIR install

