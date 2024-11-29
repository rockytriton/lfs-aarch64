
sed -e 's/-qt4/-qt5/'              \
    -e 's/moc_location/host_bins/' \
    -i examples/C/qt/meson.build   

sed -e 's/Qt/&5/'                  \
    -i meson.build
grep -rl '^#!.*python$' | xargs sed -i '1s/python/&3/'

mkdir build 
cd    build 

CXXFLAGS+="-O2 -fPIC"             \
meson setup ..                    \
      --prefix=/usr               \
      --buildtype=release         \
      -D libaudit=no              \
      -D nmtui=true               \
      -D ovs=false                \
      -D ppp=false                \
      -D selinux=false            \
      -D qt=false                 \
      -D session_tracking=systemd \
      -D modem_manager=false      
ninja

DESTDIR=$LFS_PCK_DIR ninja install

mv -v $LFS_PCK_DIR/usr/share/doc/NetworkManager{,-1.48.8}

mkdir -p $LFS_PCK_DIR/etc/NetworkManager/conf.d

cat >> $LFS_PCK_DIR/etc/NetworkManager/NetworkManager.conf << "EOF"
[main]
plugins=keyfile
EOF

cat > $LFS_PCK_DIR/etc/NetworkManager/conf.d/polkit.conf << "EOF"
[main]
auth-polkit=true
EOF

cat > $LFS_PCK_DIR/etc/NetworkManager/conf.d/dhcp.conf << "EOF"
[main]
dhcp=dhcpcd
EOF

cat > $LFS_PCK_DIR/etc/NetworkManager/conf.d/no-dns-update.conf << "EOF"
[main]
dns=none
EOF
