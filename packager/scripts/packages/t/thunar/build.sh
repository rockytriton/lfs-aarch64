./configure --prefix=/usr \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/thunar-4.18.11
make
make DESTDIR=$LFS_PCK_DIR install

