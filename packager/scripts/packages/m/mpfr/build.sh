
./configure --prefix=/usr --disable-static      \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.2.1
make
make html
make DESTDIR=$LFS_PCK_DIR install
make DESTDIR=$LFS_PCK_DIR install-html

