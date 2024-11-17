sed 's/apiversion/soup_version/' -i docs/reference/meson.build

mkdir __build
cd    __build

meson setup --prefix=/usr          \
            --buildtype=release    \
            -D vapi=enabled        \
            -D gssapi=disabled     \
            -D sysprof=disabled    \
            --wrap-mode=nofallback \
            ..     
ninja
DESTDIR=$LFS_PCK_DIR ninja install

