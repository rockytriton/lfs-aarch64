mkdir build 
cd    build 

meson setup --prefix=$XORG_PREFIX .. 
ninja


DESTDIR=$LFS_PCK_DIR ninja install 
mv -v $LFS_PCK_DIR/$XORG_PREFIX/share/doc/xorgproto{,-2024.1}
