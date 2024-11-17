sed -i -r 's:"(/system):"/org/gnome\1:g' schemas/*.in 

mkdir __build
cd    __build

meson setup --prefix=/usr --buildtype=release ..
ninja
DESTDIR=$LFS_PCK_DIR ninja install

