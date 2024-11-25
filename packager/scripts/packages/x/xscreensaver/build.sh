./configure --prefix=/usr 
make
make install_prefix=$LFS_PCK_DIR install

mkdir -p $LFS_PCK_DIR/etc/pam.d

cat > $LFS_PCK_DIR/etc/pam.d/xscreensaver << "EOF"
# Begin /etc/pam.d/xscreensaver

auth    include system-auth
account include system-account

# End /etc/pam.d/xscreensaver
EOF
