groupadd -g 64 sddm &&
useradd  -c "sddm Daemon" \
         -d /var/lib/sddm \
         -u 64 -g sddm    \
         -s /bin/false sddm


mkdir build 
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release  \
      -D RUNTIME_DIR=/run/sddm     \
      -D BUILD_MAN_PAGES=ON        \
      -D BUILD_WITH_QT6=ON         \
      -D DATA_INSTALL_DIR=/usr/share/sddm \
      -D DBUS_CONFIG_FILENAME=sddm_org.freedesktop.DisplayManager.conf \
      ..
make
make install

install -v -dm755 -o sddm -g sddm /var/lib/sddm
/usr/bin/sddm --example-config > /etc/sddm.conf
systemctl enable sddm

cat > /etc/pam.d/sddm << "EOF" &&
# Begin /etc/pam.d/sddm

auth     requisite      pam_nologin.so
auth     required       pam_env.so

auth     required       pam_succeed_if.so uid >= 1000 quiet
auth     include        system-auth

account  include        system-account
password include        system-password

session  required       pam_limits.so
session  include        system-session

# End /etc/pam.d/sddm
EOF

cat > /etc/pam.d/sddm-autologin << "EOF" &&
# Begin /etc/pam.d/sddm-autologin

auth     requisite      pam_nologin.so
auth     required       pam_env.so

auth     required       pam_succeed_if.so uid >= 1000 quiet
auth     required       pam_permit.so

account  include        system-account

password required       pam_deny.so

session  required       pam_limits.so
session  include        system-session

# End /etc/pam.d/sddm-autologin
EOF

cat > /etc/pam.d/sddm-greeter << "EOF"
# Begin /etc/pam.d/sddm-greeter

auth     required       pam_env.so
auth     required       pam_permit.so

account  required       pam_permit.so
password required       pam_deny.so
session  required       pam_unix.so
-session optional       pam_systemd.so

# End /etc/pam.d/sddm-greeter
EOF

