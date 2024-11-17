
mkdir __build
cd    __build

meson setup --prefix=/usr       \
            --buildtype=release \
            -D gtk_doc=false    \
            -D man=false        \
            ..   
ninja
DESTDIR=$LFS_PCK_DIR ninja install

if [ -e $LFS_PCK_DIR/usr/share/doc/libnotify ]; then
  rm -rf $LFS_PCK_DIR/usr/share/doc/libnotify-0.8.3
  mv -v  $LFS_PCK_DIR/usr/share/doc/libnotify{,-0.8.3}
fi
