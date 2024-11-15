sed -i '/install_man/,$d' meson.build 

mkdir build 
cd    build 

meson setup ..                       \
      --prefix=$XORG_PREFIX          \
      --buildtype=release            \
      -D xkb_output_dir=/var/lib/xkb 
ninja
ninja install
