mkdir build 
cd    build 

meson setup --prefix=$XORG_PREFIX .. 
ninja

DESTDIR=$LFS_PCK_DIR ninja install
