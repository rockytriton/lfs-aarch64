export SCRIPTS_PATH=$(pwd)
export XORG_PREFIX="/usr"
export XORG_CONFIG="--prefix=$XORG_PREFIX --sysconfdir=/etc \
    --localstatedir=/var --disable-static"
export NINJAJOBS=$(nproc)
export QT6PREFIX=/opt/qt6
export QT5PREFIX=/opt/qt5
export QT6DIR=/opt/qt6
export MAKEFLAGS="-j$(nproc)"
export KF6_PREFIX=/opt/kf6

export LFS_PCK_DIR=/tmp/pckdir
export LFS_BIN_DIR=/usr/share/lfs/bin

