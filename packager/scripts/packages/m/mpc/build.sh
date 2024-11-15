
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/mpc-1.3.1
make
make html
make DESTDIR=$LFS_PCK_DIR install
make DESTDIR=$LFS_PCK_DIR install-html


