
./configure $XORG_CONFIG --with-xinitdir=/etc/X11/app-defaults 
make
make DESTDIR=$LFS_PCK_DIR install
ldconfig
