
mkdir __build
cd    __build

meson setup --prefix=/usr --buildtype=release 
ninja
DESTDIR=$LFS_PCK_DIR ninja install

