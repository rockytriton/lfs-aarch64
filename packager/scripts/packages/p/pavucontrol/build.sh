
mkdir __build
cd    __build

meson setup --prefix=/usr --buildtype=release -D lynx=false ..
ninja
ninja install


mv /usr/share/doc/pavucontrol /usr/share/doc/pavucontrol-6.1
