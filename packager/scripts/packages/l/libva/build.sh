cd build 

meson setup --prefix=$XORG_PREFIX --buildtype=release 
ninja


ninja install
