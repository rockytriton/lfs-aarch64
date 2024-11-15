
mkdir -v build
cd       build

../configure --prefix=/usr
makeinfo --html --no-split -o doc/dejagnu.html ../doc/dejagnu.texi
makeinfo --plaintext       -o doc/dejagnu.txt  ../doc/dejagnu.texi

make DESTDIR=$LFS_PCK_DIR install

install -v -dm755  $LFS_PCK_DIR/usr/share/doc/dejagnu-1.6.3
install -v -m644   doc/dejagnu.{html,txt} $LFS_PCK_DIR/usr/share/doc/dejagnu-1.6.3
