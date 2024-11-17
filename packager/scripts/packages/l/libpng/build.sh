
./configure --prefix=/usr --disable-static 
make
make DESTDIR=$LFS_PCK_DIR install
mkdir -pv $LFS_PCK_DIR/usr/share/doc/libpng-1.6.43 
cp -v README libpng-manual.txt $LFS_PCK_DIR/usr/share/doc/libpng-1.6.43
