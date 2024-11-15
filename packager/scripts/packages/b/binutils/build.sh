mkdir -v build
cd       build

../configure --prefix=/usr       \
             --sysconfdir=/etc   \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --enable-new-dtags  \
             --with-system-zlib  \
             --enable-default-hash-style=gnu

make tooldir=/usr

make DESTDIR=$LFS_PCK_DIR tooldir=/usr install

rm -fv $LFS_PCK_DIR/usr/lib/lib{bfd,ctf,ctf-nobfd,gprofng,opcodes,sframe}.a || echo "no static libs"

