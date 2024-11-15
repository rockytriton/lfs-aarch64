mkdir build 
cd    build 

meson setup --prefix=$XORG_PREFIX \
            --buildtype=release   \
            -D udev=true          \
            -D valgrind=disabled  \
            ..                    
ninja
ninja install

