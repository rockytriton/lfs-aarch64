
./configure --prefix=/usr --disable-static 
make
make DESTDIR=$LFS_PCK_DIR install

mkdir -p $LFS_PCK_DIR/usr/share/doc/
install -v -m644 doc/Vorbis* $LFS_PCK_DIR/usr/share/doc/libvorbis-1.3.7