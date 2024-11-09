
mkdir __build
cd    __build

meson setup ..             \
      --prefix=/usr        \
      --buildtype=release  \
      -D build-tests=true  \
      -D boost-shared=true 
ninja
ninja install

