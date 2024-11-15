
cp /sources/coreutils-9.5-i18n-2.patch ..
patch -Np1 -i ../coreutils-9.5-i18n-2.patch

autoreconf -fiv
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime
make
make DESTDIR=$LFS_PCK_DIR install

mkdir -p $LFS_PCK_DIR/usr/sbin
mkdir -p $LFS_PCK_DIR/usr/share/man/man8

mv -v $LFS_PCK_DIR/usr/bin/chroot $LFS_PCK_DIR/usr/sbin
mv -v $LFS_PCK_DIR/usr/share/man/man1/chroot.1 $LFS_PCK_DIR/usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' $LFS_PCK_DIR/usr/share/man/man8/chroot.8
