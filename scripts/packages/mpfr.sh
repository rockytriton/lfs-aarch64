
./configure --prefix=/usr --disable-static      \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.2.1
make
make html
make install
make install-html

