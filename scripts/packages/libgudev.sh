
mkdir __build
cd    __build

meson setup --prefix=/usr --buildtype=release .. 
ninja
ninja install

