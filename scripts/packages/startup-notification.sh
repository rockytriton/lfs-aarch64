
./configure --prefix=/usr --disable-static --build=aarch64-unknown-linux-gnu
make
make install

install -v -m644 -D doc/startup-notification.txt \
    /usr/share/doc/startup-notification-0.12/startup-notification.txt
