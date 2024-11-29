
./configure --prefix=/usr                \
            --sysconfdir=/etc            \
            --libexecdir=/usr/lib/dhcpcd \
            --dbdir=/var/lib/dhcpcd      \
            --runstatedir=/run           \
            --disable-privsep

make
make DESTDIR=$LFS_PCK_DIR install

. $SCRIPTS_PATH/extract.sh https://www.linuxfromscratch.org/blfs/downloads/12.2-systemd/blfs-systemd-units-20240801.tar.xz
make DESTDIR=$LFS_PCK_DIR install-dhcpcd
