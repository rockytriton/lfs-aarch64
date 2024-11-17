
./configure --prefix=/usr --disable-static --build=aarch64-unknown-linux-gnu
make
make DESTDIR=$LFS_PCK_DIR install

install -v -m644 -D doc/startup-notification.txt \
    $LFS_PCK_DIR/usr/share/doc/startup-notification-0.12/startup-notification.txt
