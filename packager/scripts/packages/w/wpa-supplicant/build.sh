
cat > wpa_supplicant/.config << "EOF"
CONFIG_BACKEND=file
CONFIG_CTRL_IFACE=y
CONFIG_DEBUG_FILE=y
CONFIG_DEBUG_SYSLOG=y
CONFIG_DEBUG_SYSLOG_FACILITY=LOG_DAEMON
CONFIG_DRIVER_NL80211=y
CONFIG_DRIVER_WEXT=y
CONFIG_DRIVER_WIRED=y
CONFIG_EAP_GTC=y
CONFIG_EAP_LEAP=y
CONFIG_EAP_MD5=y
CONFIG_EAP_MSCHAPV2=y
CONFIG_EAP_OTP=y
CONFIG_EAP_PEAP=y
CONFIG_EAP_TLS=y
CONFIG_EAP_TTLS=y
CONFIG_IEEE8021X_EAPOL=y
CONFIG_IPV6=y
CONFIG_LIBNL32=y
CONFIG_PEERKEY=y
CONFIG_PKCS12=y
CONFIG_READLINE=y
CONFIG_SMARTCARD=y
CONFIG_WPS=y
CFLAGS += -I/usr/include/libnl3
CONFIG_CTRL_IFACE_DBUS=y
CONFIG_CTRL_IFACE_DBUS_NEW=y
CONFIG_CTRL_IFACE_DBUS_INTRO=y
EOF

cd wpa_supplicant &&
make BINDIR=/usr/sbin LIBDIR=/usr/lib

pushd wpa_gui-qt4 &&
qmake wpa_gui.pro &&
make &&
popd

mkdir -p $LFS_PCK_DIR/usr/sbin
mkdir -p $LFS_PCK_DIR/usr/bin
mkdir -p $LFS_PCK_DIR/usr/share/applications
mkdir -p $LFS_PCK_DIR/usr/share/man/man5
mkdir -p $LFS_PCK_DIR/usr/share/man/man8


install -v -m755 wpa_{cli,passphrase,supplicant} $LFS_PCK_DIR/usr/sbin/ &&
install -v -m644 doc/docbook/wpa_supplicant.conf.5 $LFS_PCK_DIR/usr/share/man/man5/ &&
install -v -m644 doc/docbook/wpa_{cli,passphrase,supplicant}.8 $LFS_PCK_DIR/usr/share/man/man8/

mkdir -p $LFS_PCK_DIR/usr/lib/systemd/system/

install -v -m644 systemd/*.service $LFS_PCK_DIR/usr/lib/systemd/system/

mkdir -p $LFS_PCK_DIR/usr/share/dbus-1/system-services/

install -v -m644 dbus/fi.w1.wpa_supplicant1.service \
                 $LFS_PCK_DIR/usr/share/dbus-1/system-services/ 

install -v -d -m755 $LFS_PCK_DIR/etc/dbus-1/system.d 
install -v -m644 dbus/dbus-wpa_supplicant.conf \
                 $LFS_PCK_DIR/etc/dbus-1/system.d/wpa_supplicant.conf

mkdir -p $LFS_PCK_DIR/usr/share/pixmaps/

install -v -m755 wpa_gui-qt4/wpa_gui $LFS_PCK_DIR/usr/bin/ 
install -v -m644 doc/docbook/wpa_gui.8 $LFS_PCK_DIR/usr/share/man/man8/ 
install -v -m644 wpa_gui-qt4/wpa_gui.desktop $LFS_PCK_DIR/usr/share/applications/ 
install -v -m644 wpa_gui-qt4/icons/wpa_gui.svg $LFS_PCK_DIR/usr/share/pixmaps/


./configure --prefix=/usr --disable-static 
make
make DESTDIR=$LFS_PCK_DIR install

