
mkdir build                         &&
cd    build                         
meson setup ..            \
      --prefix=/usr       \
      --buildtype=release \
      -D gtk-doc=false    \
      -D man=false        
ninja

ninja install
