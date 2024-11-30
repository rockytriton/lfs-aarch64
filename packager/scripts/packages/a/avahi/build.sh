wget https://www.linuxfromscratch.org/patches/blfs/12.2/avahi-0.8-ipv6_race_condition_fix-1.patch -P ..

groupadd -fg 84 avahi &&
useradd -c "Avahi Daemon Owner" -d /run/avahi-daemon -u 84 \
        -g avahi -s /bin/false avahi || echo "user exists"

groupadd -fg 86 netdev || echo "group exists"

patch -Np1 -i ../avahi-0.8-ipv6_race_condition_fix-1.patch

sed -i '426a if (events & AVAHI_WATCH_HUP) { \
client_free(c); \
return; \
}' avahi-daemon/simple-protocol.c

./configure \
    --prefix=/usr        \
    --sysconfdir=/etc    \
    --localstatedir=/var \
    --disable-static     \
    --disable-libevent   \
    --disable-mono       \
    --disable-monodoc    \
    --disable-python     \
    --disable-qt3        \
    --disable-qt4        \
    --enable-core-docs   \
    --with-distro=none   \
    --with-dbus-system-address='unix:path=/run/dbus/system_bus_socket'
make
make DESTDIR=$LFS_PCK_DIR install

