
./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --with-cxx-shared       \
            --enable-pc-files       \
            --with-pkg-config-libdir=/usr/lib/pkgconfig

make
make DESTDIR=$PWD/dest install

mkdir -p $LFS_PCK_DIR/usr/lib/pkgconfig

install -vm755 dest/usr/lib/libncursesw.so.6.5 $LFS_PCK_DIR/usr/lib
rm -v  dest/usr/lib/libncursesw.so.6.5
sed -e 's/^#if.*XOPEN.*$/#if 1/' \
    -i dest/usr/include/curses.h
cp -av dest/* $LFS_PCK_DIR/

for lib in ncurses form panel menu ; do
    ln -sfv lib${lib}w.so $LFS_PCK_DIR/usr/lib/lib${lib}.so
    ln -sfv ${lib}w.pc    $LFS_PCK_DIR/usr/lib/pkgconfig/${lib}.pc
done

ln -sfv libncursesw.so $LFS_PCK_DIR/usr/lib/libcurses.so
