
mkdir __build
cd    __build

meson setup ..            \
      --prefix=/usr       \
      --buildtype=release \
      -D others=enabled   \
      --wrap-mode=nofallback 
      
ninja
ninja install

