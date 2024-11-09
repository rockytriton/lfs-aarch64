
mkdir __build
cd    __build

meson setup --prefix=/usr       \
            --buildtype=release \
            -D vapi=enabled     \
            -D gssapi=disabled  \
            -D sysprof=disabled \
            ..  
ninja
ninja install

