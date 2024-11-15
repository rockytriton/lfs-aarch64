cp /sources/bzip2-1.0.8-install_docs-1.patch ..

patch -Np1 -i ../bzip2-1.0.8-install_docs-1.patch

sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile

make -f Makefile-libbz2_so
make clean

make

mkdir -p $LFS_PCK_DIR/usr/lib
mkdir -p $LFS_PCK_DIR/usr/bin

make PREFIX=$LFS_PCK_DIR/usr install

cp -av libbz2.so.* $LFS_PCK_DIR/usr/lib
ln -sv libbz2.so.1.0.8 $LFS_PCK_DIR/usr/lib/libbz2.so

cp -v bzip2-shared $LFS_PCK_DIR/usr/bin/bzip2
for i in $LFS_PCK_DIR/usr/bin/{bzcat,bunzip2}; do
  ln -sfv bzip2 $i
done

rm -fv $LFS_PCK_DIR/usr/lib/libbz2.a
