
mkdir __build
cd    __build

meson setup --prefix=/usr --buildtype=release -D gpl=enabled ..
ninja
ninja install

