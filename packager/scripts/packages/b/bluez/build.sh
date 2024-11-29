
./configure --prefix=/usr         \
            --sysconfdir=/etc     \
            --localstatedir=/var  \
            --disable-manpages    \
            --enable-library 
make
make DESTDIR=$LFS_PCK_DIR install

mkdir -p $LFS_PCK_DIR/usr/sbin

ln -svf ../libexec/bluetooth/bluetoothd $LFS_PCK_DIR/usr/sbin
install -v -dm755 $LFS_PCK_DIR/etc/bluetooth &&
install -v -m644 src/main.conf $LFS_PCK_DIR/etc/bluetooth/main.conf

