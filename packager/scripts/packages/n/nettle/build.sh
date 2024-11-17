
./configure --prefix=/usr --disable-static 
make
make DESTDIR=$LFS_PCK_DIR install

chmod   -v   755 $LFS_PCK_DIR/usr/lib/lib{hogweed,nettle}.so 
install -v -m755 -d $LFS_PCK_DIR/usr/share/doc/nettle-3.10 
install -v -m644 nettle.{html,pdf} $LFS_PCK_DIR/usr/share/doc/nettle-3.10
