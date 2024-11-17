
./configure --prefix=/usr                           \
            --disable-static                        \
            --with-openssl                          \
            --enable-threaded-resolver              \
            --with-ca-path=/etc/ssl/certs
make
make DESTDIR=$LFS_PCK_DIR install

rm -rf docs/examples/.deps

find docs \( -name Makefile\* -o  \
             -name \*.1       -o  \
             -name \*.3       -o  \
             -name CMakeLists.txt \) -delete 

mkdir -p $LFS_PCK_DIR/usr/share/doc/
cp -v -R docs -T $LFS_PCK_DIR/usr/share/doc/curl-8.9.1
