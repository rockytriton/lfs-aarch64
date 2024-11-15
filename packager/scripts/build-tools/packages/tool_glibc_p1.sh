
ln -sfv ../lib/ld-linux-aarch64.so.1 $LFS/lib64
ln -sfv ../lib/ld-linux-aarch64.so.1 $LFS/lib64/ld-lsb-aarch64.so.1

patch -Np1 -i ../glibc-2.40-fhs-1.patch

mkdir -v build
cd       build

echo "rootsbindir=/usr/sbin" > configparms

../configure                             \
      --prefix=/usr                      \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=4.19               \
      --with-headers=$LFS/usr/include    \
      --disable-nscd                     \
      libc_cv_slibdir=/usr/lib

make
make DESTDIR=$LFS install
sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd
