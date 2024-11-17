
mkdir __build
cd    __build

meson setup --prefix=/usr ..
ninja
#rm -rf /usr/share/icons/Adwaita/
DESTDIR=$LFS_PCK_DIR ninja install

