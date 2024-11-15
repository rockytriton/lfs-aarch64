
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/pkgconf-2.3.0
make
make DESTDIR=$LFS_PCK_DIR install

ln -sv pkgconf   $LFS_PCK_DIR/usr/bin/pkg-config
ln -sv pkgconf.1 $LFS_PCK_DIR/usr/share/man/man1/pkg-config.1
