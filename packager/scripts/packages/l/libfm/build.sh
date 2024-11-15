
./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --with-extra-only \
            --with-gtk=no     \
            --disable-static
make
make install

