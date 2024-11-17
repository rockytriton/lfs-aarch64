
mkdir build                         &&
cd    build                         
meson setup ..            \
      --prefix=/usr       \
      --buildtype=release \
      -D gtk-doc=false    \
      -D man=false        
ninja

DESTDIR=$LFS_PCK_DIR ninja install
