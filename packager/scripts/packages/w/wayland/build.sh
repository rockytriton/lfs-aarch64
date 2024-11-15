mkdir build 
cd    build 

meson setup ..            \
      --prefix=/usr       \
      --buildtype=release \
      -D documentation=false 
ninja


ninja install
