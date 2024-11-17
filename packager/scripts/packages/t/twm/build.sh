sed -i -e '/^rcdir =/s,^\(rcdir = \).*,\1/etc/X11/app-defaults,' src/Makefile.in 
./configure $XORG_CONFIG
make
make DESTDIR=$LFS_PCK_DIR install

