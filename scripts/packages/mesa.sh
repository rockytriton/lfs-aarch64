wget https://www.linuxfromscratch.org/patches/blfs/12.2/mesa-add_xdemos-2.patch -P ..

patch -Np1 -i ../mesa-add_xdemos-2.patch

GALLIUM_DRV="auto,virgl"
DRI_DRIVERS="nouveau"

mkdir build 
cd    build 

meson setup ..                 \
      --prefix=$XORG_PREFIX    \
      --buildtype=release      \
      -D dri-drivers=$DRI_DRIVERS     \
      -D gallium-drivers=$GALLIUM_DRV \
      -D gallium-nine=false           \
      -D glx=dri                      \
      -D platforms=x11,wayland \
      -D valgrind=disabled     \
      -D libunwind=disabled    

ninja

ninja install

