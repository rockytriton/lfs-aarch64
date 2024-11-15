
./configure --prefix=/usr --sysconfdir=/etc  \
            --with-ssl=openssl
make
make DESTDIR=$LFS_PCK_DIR install

