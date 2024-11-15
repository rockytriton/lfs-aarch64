
FORCE_UNSAFE_CONFIGURE=1  ./configure --prefix=/usr
make
make DESTDIR=$LFS_PCK_DIR install

make DESTDIR=$LFS_PCK_DIR -C doc install-html docdir=/usr/share/doc/tar-1.35
