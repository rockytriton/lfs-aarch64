
mkdir build &&
cd    build &&

meson setup ..            \
      --prefix=/usr       \
      --buildtype=release \
      -D gconv=disabled   \
      -D doxygen-doc=disabled &&
ninja
DESTDIR=$LFS_PCK_DIR ninja install

mkdir -p $LFS_PCK_DIR/usr/bin

for prog in v4l2gl v4l2grab
do
   cp -v contrib/test/$prog $LFS_PCK_DIR/usr/bin
done