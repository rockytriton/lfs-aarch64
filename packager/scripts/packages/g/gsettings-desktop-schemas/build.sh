sed -i -r 's:"(/system):"/org/gnome\1:g' schemas/*.in 

mkdir __build
cd    __build

meson setup --prefix=/usr --buildtype=release ..
ninja
ninja install

