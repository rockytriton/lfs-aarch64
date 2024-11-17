mkdir build 
cd    build 

meson setup ..               \
      --prefix=/usr          \
      --buildtype=release    \
      --wrap-mode=nodownload 
ninja
DESTDIR=$LFS_PCK_DIR ninja install
