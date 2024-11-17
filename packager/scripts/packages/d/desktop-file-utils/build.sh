
mkdir build &&
cd    build &&

meson setup --prefix=/usr --buildtype=release .. &&
ninja
DESTDIR=$LFS_PCK_DIR ninja install

install -vdm755 $LFS_PCK_DIR/usr/share/applications
