
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/pkgconf-2.3.0
make
make install

ln -sv pkgconf   /usr/bin/pkg-config
ln -sv pkgconf.1 /usr/share/man/man1/pkg-config.1
