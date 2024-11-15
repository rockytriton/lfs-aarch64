
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/flex-2.6.4
make
make DESTDIR=$LFS_PCK_DIR install

ln -sv flex   $LFS_PCK_DIR/usr/bin/lex
ln -sv flex.1 $LFS_PCK_DIR/usr/share/man/man1/lex.1
