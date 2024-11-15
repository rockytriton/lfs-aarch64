
mkdir __build
cd    __build

meson setup ..            \
      --prefix=/usr       \
      --buildtype=release \
      -D docs=false  
      
ninja
ninja install

