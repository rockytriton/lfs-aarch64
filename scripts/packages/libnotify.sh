
mkdir __build
cd    __build

meson setup --prefix=/usr       \
            --buildtype=release \
            -D gtk_doc=false    \
            -D man=false        \
            ..   
ninja
ninja install

if [ -e /usr/share/doc/libnotify ]; then
  rm -rf /usr/share/doc/libnotify-0.8.3
  mv -v  /usr/share/doc/libnotify{,-0.8.3}
fi
