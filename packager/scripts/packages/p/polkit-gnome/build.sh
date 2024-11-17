wget https://www.linuxfromscratch.org/patches/blfs/12.2/polkit-gnome-0.105-consolidated_fixes-1.patch -P ..

patch -Np1 -i ../polkit-gnome-0.105-consolidated_fixes-1.patch

./configure --prefix=/usr --build=aarch64-unknown-linux-gnu
make
make DESTDIR=$LFS_PCK_DIR install

mkdir -p $LFS_PCK_DIR/etc/xdg/autostart 
cat > $LFS_PCK_DIR/etc/xdg/autostart/polkit-gnome-authentication-agent-1.desktop << "EOF"
[Desktop Entry]
Name=PolicyKit Authentication Agent
Comment=PolicyKit Authentication Agent
Exec=/usr/libexec/polkit-gnome-authentication-agent-1
Terminal=false
Type=Application
Categories=
NoDisplay=true
OnlyShowIn=GNOME;XFCE;Unity;
AutostartCondition=GNOME3 unless-session gnome
EOF
