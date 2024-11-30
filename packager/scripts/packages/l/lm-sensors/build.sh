
make PREFIX=/usr           \
     BUILD_STATIC_LIB=0    \
     MANDIR=/usr/share/man \
     EXLDFLAGS=
make PREFIX=/usr        \
     BUILD_STATIC_LIB=0 \
     MANDIR=/usr/share/man DESTDIR=$LFS_PCK_DIR install

