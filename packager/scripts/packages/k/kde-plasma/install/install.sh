
# Setup xsessions (X11 sessions)
install -dvm 755 /usr/share/xsessions
cd /usr/share/xsessions

[ -e plasma.desktop ] ||
ln -sfv $KF6_PREFIX/share/xsessions/plasmax11.desktop 

# Setup wayland-sessions 
install -dvm 755 /usr/share/wayland-sessions
cd /usr/share/wayland-sessions

[ -e plasmawayland.desktop ] ||
ln -sfv $KF6_PREFIX/share/wayland-sessions/plasma.desktop

# Setup xdg-desktop-portal
install -dvm 755 /usr/share/xdg-desktop-portal
cd /usr/share/xdg-desktop-portal 

[ -e kde-portals.conf ] ||
ln -sfv $KF6_PREFIX/share/xdg-desktop-portal/kde-portals.conf

# Setup kde portal
install -dvm 755 /usr/share/xdg-desktop-portal/portals
cd /usr/share/xdg-desktop-portal/portals

[ -e kde.portal ] ||
ln -sfv $KF6_PREFIX/share/xdg-desktop-portal/portals/kde.portal

cat > /etc/pam.d/kde << "EOF"
# Begin /etc/pam.d/kde

auth     requisite      pam_nologin.so
auth     required       pam_env.so

auth     required       pam_succeed_if.so uid >= 1000 quiet
auth     include        system-auth

account  include        system-account
password include        system-password
session  include        system-session

# End /etc/pam.d/kde
EOF

cat > /etc/pam.d/kde-np << "EOF"
# Begin /etc/pam.d/kde-np

auth     requisite      pam_nologin.so
auth     required       pam_env.so

auth     required       pam_succeed_if.so uid >= 1000 quiet
auth     required       pam_permit.so

account  include        system-account
password include        system-password
session  include        system-session

# End /etc/pam.d/kde-np
EOF

cat > /etc/pam.d/kscreensaver << "EOF"
# Begin /etc/pam.d/kscreensaver

auth    include system-auth
account include system-account

# End /etc/pam.d/kscreensaver
EOF

