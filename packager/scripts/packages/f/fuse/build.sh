
sed -i '/^udev/,$ s/^/#/' util/meson.build 

mkdir build &&
cd    build 

meson setup --prefix=/usr --buildtype=release .. 
ninja
DESTDIR=$LFS_PCK_DIR ninja install

chmod u+s $LFS_PCK_DIR/usr/bin/fusermount3 

