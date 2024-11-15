
mkdir __build
cd    __build
meson setup             \
   --prefix=/usr        \
   --buildtype=release  \
   -D libproxy=disabled \
   .. 
ninja
ninja install

