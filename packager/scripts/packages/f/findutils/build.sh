
./configure --prefix=/usr --localstatedir=/var/lib/locate
make
make DESTDIR=$LFS_PCK_DIR install

