
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/acl-2.3.2
make
make DESTDIR=$LFS_PCK_DIR install

