./configure --prefix=/usr \
            --sysconfdir=/etc \
            --disable-legacy-sm 
make
make DESTDIR=$LFS_PCK_DIR install
