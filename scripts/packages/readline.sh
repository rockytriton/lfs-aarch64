
sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install

sed -i 's/-Wl,-rpath,[^ ]*//' support/shobj-conf

./configure --prefix=/usr    \
            --disable-static \
            --with-curses    \
            --docdir=/usr/share/doc/readline-8.2.13

make SHLIB_LIBS="-lncursesw"   
make SHLIB_LIBS="-lncursesw" DESTDIR=$LFS_PCK_DIR install
install -v -m644 doc/*.{ps,pdf,html,dvi} $LFS_PCK_DIR/usr/share/doc/readline-8.2.13
