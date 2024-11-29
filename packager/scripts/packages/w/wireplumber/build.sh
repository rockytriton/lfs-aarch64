
mkdir build 
cd    build 

meson setup --prefix=/usr --buildtype=release -D system-lua=true .. 
ninja
DESTDIR=$LFS_PCK_DIR ninja install

