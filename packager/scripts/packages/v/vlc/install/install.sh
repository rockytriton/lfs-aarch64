gtk-update-icon-cache -qtf /usr/share/icons/hicolor || echo "no gtk"
update-desktop-database -q || echo "no update desktop"