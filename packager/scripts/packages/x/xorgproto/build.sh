mkdir build 
cd    build 

meson setup --prefix=$XORG_PREFIX .. 
ninja


ninja install 
mv -v $XORG_PREFIX/share/doc/xorgproto{,-2024.1}
