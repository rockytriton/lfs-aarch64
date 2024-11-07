mkdir build 
cd    build 

meson setup ..               \
      --prefix=/usr          \
      --buildtype=release    \
      --wrap-mode=nodownload 
ninja
ninja install
