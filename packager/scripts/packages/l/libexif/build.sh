
./configure --prefix=/usr --disable-static --with-doc-dir=/usr/share/doc/libexif-0.6.24
make
make DESTDIR=$LFS_PCK_DIR install

