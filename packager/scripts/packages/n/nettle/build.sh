
./configure --prefix=/usr --disable-static 
make
make install

chmod   -v   755 /usr/lib/lib{hogweed,nettle}.so &&
install -v -m755 -d /usr/share/doc/nettle-3.10 &&
install -v -m644 nettle.{html,pdf} /usr/share/doc/nettle-3.10
