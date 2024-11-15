wget https://www.linuxfromscratch.org/patches/blfs/12.2/glib-skip_warnings-1.patch -P ..

patch -Np1 -i ../glib-skip_warnings-1.patch

mkdir build 
cd    build 

meson setup ..                  \
      --prefix=/usr             \
      --buildtype=release       \
      -D introspection=enabled \
      -D man-pages=enabled      

ninja
DESTDIR=$LFS_PCK_DIR ninja install