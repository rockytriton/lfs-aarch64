mkdir build 
cd    build 

meson setup ..            \
      --prefix=/usr       \
      --buildtype=release \
      -D gst_debug=false  
ninja
DESTDIR=$LFS_PCK_DIR ninja install
