
mkdir build 
cd    build 

meson setup ..                 \
      --prefix=/usr            \
      --buildtype=release      \
      -D session-managers="[]" 
ninja
DESTDIR=$LFS_PCK_DIR ninja install

