
./configure --prefix=/usr 
make
make html
make DESTDIR=$LFS_PCK_DIR install

install -d -m755           $LFS_PCK_DIR/usr/share/doc/sed-4.9
install -m644 doc/sed.html $LFS_PCK_DIR/usr/share/doc/sed-4.9
