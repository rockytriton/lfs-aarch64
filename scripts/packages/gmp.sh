
./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.3.0
make
make html
make DESTDIR=$LFS_PCK_DIR install
make DESTDIR=$LFS_PCK_DIR install-html

