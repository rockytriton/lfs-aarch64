
mkdir __build
cd    __build

meson setup --prefix=/usr --buildtype=release  --wrap-mode=nofallback ..
ninja
ninja install

