
mkdir __build
cd    __build

meson setup --prefix=/usr --buildtype=release -D enable-docs=false  ..
ninja
DESTDIR=$LFS_PCK_DIR ninja install

