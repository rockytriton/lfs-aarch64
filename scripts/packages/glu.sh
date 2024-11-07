
mkdir __build
cd    __build

meson setup ..              \
      --prefix=$XORG_PREFIX \
      -D gl_provider=gl     \
      --buildtype=release 
ninja
ninja install

rm -vf /usr/lib/libGLU.a
