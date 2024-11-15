./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --disable-static  \
            --docdir=/usr/share/doc/openbox-3.6.1  --build=aarch64-unknown-linux-gnu
make
make install

rm -v /usr/share/xsessions/openbox-{gnome,kde}.desktop
