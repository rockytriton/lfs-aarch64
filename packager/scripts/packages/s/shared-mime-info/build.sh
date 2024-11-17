
mkdir __build
cd    __build

meson setup --prefix=/usr --buildtype=release -D update-mimedb=true ..
ninja
DESTDIR=$LFS_PCK_DIR ninja install

