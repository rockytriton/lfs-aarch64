
./configure --prefix=/usr        \
            --sysconfdir=/etc    \
            --localstatedir=/var \
            --disable-static
make
make DESTDIR=$LFS_PCK_DIR install

