
./configure --prefix=/usr           \
            --sysconfdir=/etc/lynx  \
            --with-zlib             \
            --with-bzlib            \
            --with-ssl              \
            --with-screen=ncursesw  \
            --enable-locale-charset \
            --datadir=/usr/share/doc/lynx-2.9.2
make
make DESTDIR=$LFS_PCK_DIR install-full
chgrp -v -R root $LFS_PCK_DIR/usr/share/doc/lynx-2.9.2/lynx_doc

