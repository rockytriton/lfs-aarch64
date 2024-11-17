./configure --prefix=/usr    \
            --enable-vala    \
            --disable-static \
            --docdir=/usr/share/doc/librsvg-2.58.3
make
make DESTDIR=$LFS_PCK_DIR DOC_INSTALL_DIR='$(docdir)' install

