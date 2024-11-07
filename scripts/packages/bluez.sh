./configure --prefix=/usr         \
            --sysconfdir=/etc     \
            --localstatedir=/var  \
            --disable-manpages    \
            --enable-library
make
make install

ln -svf ../libexec/bluetooth/bluetoothd /usr/sbin

install -v -dm755 /etc/bluetooth 
install -v -m644 src/main.conf /etc/bluetooth/main.conf
