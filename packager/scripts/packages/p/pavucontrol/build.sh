
mkdir __build
cd    __build

meson setup --prefix=/usr --buildtype=release -D lynx=false ..
ninja
DESTDIR=$LFS_PCK_DIR ninja install


mv $LFS_PCK_DIR/usr/share/doc/pavucontrol $LFS_PCK_DIR/usr/share/doc/pavucontrol-6.1
