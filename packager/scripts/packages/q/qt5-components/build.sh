export QT5PREFIX=/opt/qt5
wget https://www.linuxfromscratch.org/patches/blfs/12.2/qt-everywhere-opensource-src-5.15.14-kf5-1.patch -P ..


patch -Np1 -i ../qt-everywhere-opensource-src-5.15.14-kf5-1.patch
mkdir -pv qtbase/.git
ls -Fd qt* | grep / | sed 's/^/-skip /;s@/@@' > tempconf 
sed -i -r '/base|tools|x11extras|svg|declarative|wayland/d' tempconf

./configure -prefix $QT5PREFIX   \
            -sysconfdir /etc/xdg \
            -confirm-license     \
            -opensource          \
            -dbus-linked         \
            -openssl-linked      \
            -system-harfbuzz     \
            -system-sqlite       \
            -nomake examples     \
            -no-rpath            \
            -journald            \
            $(cat tempconf)
make
make DESTDIR=$LFS_PCK_DIR install

find ${LFS_PCK_DIR}$QT5PREFIX/ -name \*.prl \
   -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

QT5BINDIR=$QT5PREFIX/bin

install -v -dm755 $LFS_PCK_DIR/usr/share/pixmaps/                  

install -v -Dm644 qttools/src/assistant/assistant/images/assistant-128.png \
                  $LFS_PCK_DIR/usr/share/pixmaps/assistant-qt5.png 

install -v -Dm644 qttools/src/designer/src/designer/images/designer.png \
                  $LFS_PCK_DIR/usr/share/pixmaps/designer-qt5.png  

install -v -Dm644 qttools/src/linguist/linguist/images/icons/linguist-128-32.png \
                  $LFS_PCK_DIR/usr/share/pixmaps/linguist-qt5.png  

install -v -Dm644 qttools/src/qdbus/qdbusviewer/images/qdbusviewer-128.png \
                  $LFS_PCK_DIR/usr/share/pixmaps/qdbusviewer-qt5.png 

install -dm755 $LFS_PCK_DIR/usr/share/applications 

cat > $LFS_PCK_DIR/usr/share/applications/assistant-qt5.desktop << EOF
[Desktop Entry]
Name=Qt5 Assistant
Comment=Shows Qt5 documentation and examples
Exec=$QT5BINDIR/assistant
Icon=assistant-qt5.png
Terminal=false
Encoding=UTF-8
Type=Application
Categories=Qt;Development;Documentation;
EOF

cat > $LFS_PCK_DIR/usr/share/applications/designer-qt5.desktop << EOF
[Desktop Entry]
Name=Qt5 Designer
GenericName=Interface Designer
Comment=Design GUIs for Qt5 applications
Exec=$QT5BINDIR/designer
Icon=designer-qt5.png
MimeType=application/x-designer;
Terminal=false
Encoding=UTF-8
Type=Application
Categories=Qt;Development;
EOF

cat > $LFS_PCK_DIR/usr/share/applications/linguist-qt5.desktop << EOF
[Desktop Entry]
Name=Qt5 Linguist
Comment=Add translations to Qt5 applications
Exec=$QT5BINDIR/linguist
Icon=linguist-qt5.png
MimeType=text/vnd.trolltech.linguist;application/x-linguist;
Terminal=false
Encoding=UTF-8
Type=Application
Categories=Qt;Development;
EOF

cat > $LFS_PCK_DIR/usr/share/applications/qdbusviewer-qt5.desktop << EOF
[Desktop Entry]
Name=Qt5 QDbusViewer
GenericName=D-Bus Debugger
Comment=Debug D-Bus applications
Exec=$QT5BINDIR/qdbusviewer
Icon=qdbusviewer-qt5.png
Terminal=false
Encoding=UTF-8
Type=Application
Categories=Qt;Development;Debugger;
EOF

mkdir -p $LFS_PCK_DIR/usr/bin/

for file in moc uic rcc qmake lconvert lrelease lupdate; do
  ln -sfvn $QT5BINDIR/$file $LFS_PCK_DIR/usr/bin/$file-qt5
done

mkdir -p $LFS_PCK_DIR/etc/sudoers.d
mkdir -p $LFS_PCK_DIR/etc/profile.d

cat > $LFS_PCK_DIR/etc/sudoers.d/qt << "EOF"
Defaults env_keep += QT5DIR
EOF

cat > /etc/profile.d/qt_5.sh << "EOF"
# Begin /etc/profile.d/qt_5.sh

QT5DIR=/opt/qt5

pathappend $QT5DIR/bin           PATH
pathappend $QT5DIR/lib/pkgconfig PKG_CONFIG_PATH

export QT5DIR

# End /etc/profile.d/qt_5.sh
EOF
