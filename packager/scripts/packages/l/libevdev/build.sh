
mkdir build 
cd    build 

meson setup ..                  \
      --prefix=$XORG_PREFIX     \
      --buildtype=release       \
      -D documentation=disabled 
ninja
ninja install

