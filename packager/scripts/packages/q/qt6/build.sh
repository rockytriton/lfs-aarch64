export QT6PREFIX=/opt/qt6

mkdir -pv $LFS_PCK_DIR/opt/qt-6.7.2
ln -sfnv qt-6.7.2 $LFS_PCK_DIR/opt/qt6

if [ "$(uname -m)" == "i686" ]; then
    sed -e "/^#elif defined(Q_CC_GNU_ONLY)/s/.*/& \&\& 0/" \
        -i qtbase/src/corelib/global/qtypes.h
fi

./configure -prefix $QT6PREFIX      \
            -sysconfdir /etc/xdg    \
            -dbus-linked            \
            -openssl-linked         \
            -system-sqlite          \
            -nomake examples        \
            -no-rpath               \
            -journald               \
            -skip qt3d              \
            -skip qtquick3dphysics  \
            -skip qtwebengine       \
            -W no-dev 
ninja
DESTDIR=$LFS_PCK_DIR ninja install

find ${LFS_PCK_DIR}$QT6PREFIX/ -name \*.prl \
   -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

pushd qttools/src

mkdir -p $LFS_PCK_DIR/usr/share/pixmaps/

install -v -Dm644 assistant/assistant/images/assistant-128.png       \
                  $LFS_PCK_DIR/usr/share/pixmaps/assistant-qt6.png               &&

install -v -Dm644 designer/src/designer/images/designer.png          \
                  $LFS_PCK_DIR/usr/share/pixmaps/designer-qt6.png                &&

install -v -Dm644 linguist/linguist/images/icons/linguist-128-32.png \
                  $LFS_PCK_DIR/usr/share/pixmaps/linguist-qt6.png                &&

install -v -Dm644 qdbus/qdbusviewer/images/qdbusviewer-128.png       \
                  $LFS_PCK_DIR/usr/share/pixmaps/qdbusviewer-qt6.png             &&
popd 


