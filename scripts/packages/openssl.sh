
./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic
make
sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make DESTDIR=$LFS_PCK_DIR MANSUFFIX=ssl install

mv -v $LFS_PCK_DIR/usr/share/doc/openssl $LFS_PCK_DIR/usr/share/doc/openssl-3.3.1
