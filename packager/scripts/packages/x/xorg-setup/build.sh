export XORG_PREFIX="/usr"

export XORG_CONFIG="--prefix=$XORG_PREFIX --sysconfdir=/etc \
    --localstatedir=/var --disable-static"

mkdir -p $LFS_PCK_DIR/etc/profile.d
mkdir -p $LFS_PCK_DIR/etc/sudoers.d

cat > $LFS_PCK_DIR/etc/profile.d/xorg.sh << EOF
XORG_PREFIX="$XORG_PREFIX"
XORG_CONFIG="--prefix=\$XORG_PREFIX --sysconfdir=/etc --localstatedir=/var --disable-static"
export XORG_PREFIX XORG_CONFIG
EOF
chmod 644 $LFS_PCK_DIR/etc/profile.d/xorg.sh

cat > $LFS_PCK_DIR/etc/sudoers.d/xorg << EOF
Defaults env_keep += XORG_PREFIX
Defaults env_keep += XORG_CONFIG
EOF

