mv -v tests/test_gdbus.py{,.nouse}         &&
mv -v tests/test_overrides_gtk.py{,.nouse}

mkdir __build
cd    __build

meson setup --prefix=/usr --buildtype=release ..
ninja
DESTDIR=$LFS_PCK_DIR ninja install

