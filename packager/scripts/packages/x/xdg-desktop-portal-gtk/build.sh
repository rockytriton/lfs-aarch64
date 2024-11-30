
mkdir build &&
cd    build 

meson setup --prefix=/usr --buildtype=release -Dwallpaper=disabled .. 
ninja
DESTDIR=$LFS_PCK_DIR ninja install

