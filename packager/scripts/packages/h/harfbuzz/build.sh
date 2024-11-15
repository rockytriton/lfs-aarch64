
mkdir build 
cd    build 

meson setup ..             \
      --prefix=/usr        \
      --buildtype=release  \
      -D graphite2=enabled 
ninja

ninja install

