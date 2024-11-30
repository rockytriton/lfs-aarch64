mkdir _build
cd _build

meson setup                \
      --prefix=/usr        \
      --buildtype=release  \
      -D gtk_doc=false     \
      -D tests=false       \
      ..
ninja
DESTDIR=$LFS_PCK_DIR ninja install

