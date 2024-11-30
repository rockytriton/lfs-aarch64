
./configure --prefix=/usr           \
            --sysconfdir=/etc       \
            --docdir=/usr/share/doc/smartmontools-7.4 
make
make DESTDIR=$LFS_PCK_DIR install

