export SCRIPTS_PATH=$(pwd)
export XORG_PREFIX="/usr"
export XORG_CONFIG="--prefix=$XORG_PREFIX --sysconfdir=/etc \
    --localstatedir=/var --disable-static"
export NINJAJOBS=$(nproc)
export QT6PREFIX=/opt/qt6
