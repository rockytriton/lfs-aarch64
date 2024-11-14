
mkdir __build
cd    __build

meson setup --prefix=/usr            \
            --buildtype=release      \
            -D broadway-backend=true \
            -D introspection=enabled \
            -D vulkan=disabled       \
            ..
ninja
ninja install

mkdir -pv /etc/gtk-4.0
cat > /etc/gtk-4.0/settings.ini << "EOF"
[Settings]
gtk-theme-name = Adwaita
gtk-icon-theme-name = hicolor
gtk-font-name = DejaVu Sans 12
gtk-cursor-theme-size = 18
gtk-xft-antialias = 1
gtk-xft-hinting = 1
gtk-xft-hintstyle = hintslight
gtk-xft-rgba = rgb
gtk-cursor-theme-name = Adwaita
EOF