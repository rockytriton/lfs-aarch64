mkdir build 
cd    build 

meson setup --prefix=$XORG_PREFIX .. 
ninja

ninja install
