
mkdir build 
cd    build 

meson setup ..             \
      --prefix=/usr        \
      --buildtype=release  \
      -D graphite2=enabled 
ninja

DESTDIR=$LFS_PCK_DIR ninja install

