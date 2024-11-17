
./configure --prefix=/usr --disable-static --sysconfdir=/etc 
make
make DESTDIR=$LFS_PCK_DIR install

