
mkdir __build
cd    __build

meson setup ..                 \
      --prefix=/usr            \
      --buildtype=release      \
      -D man=true              \
      -D broadway_backend=true

ninja
DESTDIR=$LFS_PCK_DIR ninja install

mkdir -vp $LFS_PCK_DIR/etc/gtk-3.0
cat > $LFS_PCK_DIR/etc/gtk-3.0/settings.ini << "EOF"
[Settings]
gtk-theme-name = Adwaita
gtk-icon-theme-name = hicolor
gtk-font-name = DejaVu Sans 12
gtk-cursor-theme-size = 18
gtk-toolbar-style = GTK_TOOLBAR_BOTH_HORIZ
gtk-xft-antialias = 1
gtk-xft-hinting = 1
gtk-xft-hintstyle = hintslight
gtk-xft-rgba = rgb
gtk-cursor-theme-name = Adwaita
EOF

cat > $LFS_PCK_DIR/etc/gtk-3.0/gtk.css << "EOF"
*  {
   -GtkScrollbar-has-backward-stepper: 1;
   -GtkScrollbar-has-forward-stepper: 1;
}
EOF
