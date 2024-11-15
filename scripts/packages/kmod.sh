
./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --with-openssl    \
            --with-xz         \
            --with-zstd       \
            --with-zlib       \
            --disable-manpages
make
make DESTDIR=$LFS_PCK_DIR install

mkdir -p $LFS_PCK_DIR/usr/sbin

for target in depmod insmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod $LFS_PCK_DIR/usr/sbin/$target
  rm -fv $LFS_PCK_DIR/usr/bin/$target
done
