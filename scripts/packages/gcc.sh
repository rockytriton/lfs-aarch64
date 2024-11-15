
sed -e '/lp64=/s/lib64/lib/' -i.orig gcc/config/aarch64/t-aarch64-linux

mkdir -v build
cd       build

../configure --prefix=/usr            \
             LD=ld                    \
             --enable-languages=c,c++ \
             --enable-default-pie     \
             --enable-default-ssp     \
             --enable-host-pie        \
             --disable-multilib       \
             --disable-bootstrap      \
             --disable-fixincludes    \
             --with-system-zlib

make
make DESTDIR=$LFS_PCK_DIR install

mkdir -p $LFS_PCK_DIR/usr/lib/gcc/$(gcc -dumpmachine)/14.2.0/include
mkdir -p $LFS_PCK_DIR/usr/lib/gcc/$(gcc -dumpmachine)/14.2.0/include-fixed

chown -v -R root:root \
    $LFS_PCK_DIR/usr/lib/gcc/$(gcc -dumpmachine)/14.2.0/include{,-fixed}

mkdir -p $LFS_PCK_DIR/usr/lib/bfd-plugins
mkdir -p $LFS_PCK_DIR/usr/bin
mkdir -p $LFS_PCK_DIR/usr/share/man/man1/

ln -svr /usr/bin/cpp $LFS_PCK_DIR/usr/lib
ln -sv gcc.1 $LFS_PCK_DIR/usr/share/man/man1/cc.1
ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/14.2.0/liblto_plugin.so \
        $LFS_PCK_DIR/usr/lib/bfd-plugins/

echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib'

mkdir -pv $LFS_PCK_DIR/usr/share/gdb/auto-load/usr/lib
mv -v $LFS_PCK_DIR/usr/lib/*gdb.py $LFS_PCK_DIR/usr/share/gdb/auto-load/usr/lib
