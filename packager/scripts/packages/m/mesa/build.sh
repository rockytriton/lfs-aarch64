wget https://www.linuxfromscratch.org/patches/blfs/12.2/mesa-add_xdemos-2.patch -P ..

patch -Np1 -i ../mesa-add_xdemos-2.patch

mkdir build 
cd    build 

meson setup ..                 \
      --prefix=$XORG_PREFIX    \
      --buildtype=release      \
      -D platforms=x11,wayland \
      -D gallium-drivers=swrast,svga,virgl  \
      -D vulkan-drivers=nouveau,swrast   \
      -D valgrind=disabled     \
      -D libunwind=disabled    

ninja

DESTDIR=$LFS_PCK_DIR ninja install

