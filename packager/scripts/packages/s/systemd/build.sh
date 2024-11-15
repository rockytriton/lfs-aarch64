cp /sources/systemd-man-pages-256.4.tar.xz ..

sed -i -e 's/GROUP="render"/GROUP="video"/' \
       -e 's/GROUP="sgx", //' rules.d/50-udev-default.rules.in

mkdir -p build
cd       build

meson setup ..                \
      --prefix=/usr           \
      --buildtype=release     \
      -D default-dnssec=no    \
      -D firstboot=false      \
      -D install-tests=false  \
      -D ldconfig=false       \
      -D sysusers=false       \
      -D rpmmacrosdir=no      \
      -D homed=disabled       \
      -D userdb=false         \
      -D man=disabled         \
      -D mode=release         \
      -D pamconfdir=no        \
      -D dev-kvm-mode=0660    \
      -D nobody-group=nogroup \
      -D sysupdate=disabled   \
      -D ukify=disabled       \
      -D docdir=/usr/share/doc/systemd-256.4

ninja
DESTDIR=$LFS_PCK_DIR ninja install

mkdir -p $LFS_PCK_DIR/usr/share/man

tar -xf ../../systemd-man-pages-256.4.tar.xz \
    --no-same-owner --strip-components=1   \
    -C $LFS_PCK_DIR/usr/share/man
