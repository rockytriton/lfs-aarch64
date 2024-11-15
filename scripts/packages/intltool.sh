sed -i 's:\\\${:\\\$\\{:' intltool-update.in
./configure --prefix=/usr
make
make DESTDIR=$LFS_PCK_DIR install
install -v -Dm644 doc/I18N-HOWTO $LFS_PCK_DIR/usr/share/doc/intltool-0.51.0/I18N-HOWTO

