wget https://download.gnome.org/sources/gobject-introspection/1.80/gobject-introspection-1.80.1.tar.xz -P ..
wget https://www.linuxfromscratch.org/patches/blfs/12.2/glib-skip_warnings-1.patch -P ..

patch -Np1 -i ../glib-skip_warnings-1.patch


mkdir build 
cd    build 

meson setup ..                  \
      --prefix=/usr             \
      --buildtype=release       \
      -D introspection=disabled \
      -D man-pages=enabled      
ninja

ninja install

tar xf ../../gobject-introspection-1.80.1.tar.xz 

meson setup gobject-introspection-1.80.1 gi-build \
            --prefix=/usr --buildtype=release     
ninja -C gi-build
ninja -C gi-build install

meson configure -D introspection=enabled &&
ninja
ninja install
