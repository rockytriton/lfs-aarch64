mkdir build &&
cd    build 

meson setup ..            \
      --prefix=/usr       \
      --buildtype=release \
      -D gconv=disabled   \
      -D doxygen-doc=disabled 
ninja
ninja install