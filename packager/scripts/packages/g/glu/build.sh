
mkdir __build
cd    __build

meson setup ..              \
      --prefix=$XORG_PREFIX \
      -D gl_provider=gl     \
      --buildtype=release 
ninja
DESTDIR=$LFS_PCK_DIR ninja install

rm -vf $LFS_PCK_DIR/usr/lib/libGLU.a
