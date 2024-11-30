
mkdir _build &&
cd    _build &&

meson setup --prefix=/usr --buildtype=release ..
ninja
DESTDIR=$LFS_PCK_DIR ninja install

