export KF6_PREFIX=/opt/kf6


cat > /etc/profile.d/kf6.sh << "EOF"
# Begin /etc/profile.d/kf6.sh

export KF6_PREFIX=/opt/kf6

pathappend $KF6_PREFIX/bin              PATH
pathappend $KF6_PREFIX/lib/pkgconfig    PKG_CONFIG_PATH

pathappend $KF6_PREFIX/etc/xdg          XDG_CONFIG_DIRS
pathappend $KF6_PREFIX/share            XDG_DATA_DIRS

pathappend $KF6_PREFIX/lib/plugins      QT_PLUGIN_PATH
pathappend $KF6_PREFIX/lib/plugins/kcms QT_PLUGIN_PATH

pathappend $KF6_PREFIX/lib/qml          QML2_IMPORT_PATH

pathappend $KF6_PREFIX/lib/python3.12/site-packages PYTHONPATH

pathappend $KF6_PREFIX/share/man        MANPATH

pathappend $KF6_PREFIX/include          CPLUS_INCLUDE_PATH
# End /etc/profile.d/kf6.sh
EOF

cat >> /etc/profile.d/qt6.sh << "EOF"
# Begin Qt6 changes for KF6

pathappend /usr/lib/plugins            QT_PLUGIN_PATH
pathappend $QT6DIR/plugins             QT_PLUGIN_PATH
pathappend $QT6DIR/qml                 QML2_IMPORT_PATH

# End Qt6 changes for KF6
EOF

cat >> /etc/ld.so.conf << "EOF"
# Begin KF6 addition

/opt/kf6/lib

# End KF6 addition
EOF

install -v -dm755           $KF6_PREFIX/{etc,share} 
ln -sfv /etc/dbus-1         $KF6_PREFIX/etc         
ln -sfv /usr/share/dbus-1   $KF6_PREFIX/share       
ln -sfv /usr/share/polkit-1 $KF6_PREFIX/share       
install -v -dm755           $KF6_PREFIX/lib         
ln -sfv /usr/lib/systemd    $KF6_PREFIX/lib

install -v -dm755                $KF6_PREFIX/share/icons 
ln -sfv /usr/share/icons/hicolor $KF6_PREFIX/share/icons

