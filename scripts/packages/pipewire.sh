
mkdir __build
cd    __build

meson setup --prefix=/usr --buildtype=release -D session-managers="[]"  ..
ninja
ninja install

