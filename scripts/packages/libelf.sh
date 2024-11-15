
./configure --prefix=/usr                \
            --disable-debuginfod         \
            --enable-libdebuginfod=dummy
make
make -C libelf DESTDIR=$LFS_PCK_DIR install
mkdir -p $LFS_PCK_DIR/usr/lib/pkgconfig

install -vm644 config/libelf.pc $LFS_PCK_DIR/usr/lib/pkgconfig
rm $LFS_PCK_DIR/usr/lib/libelf.a

