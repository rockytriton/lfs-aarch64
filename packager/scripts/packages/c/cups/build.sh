
useradd -c "Print Service User" -d /var/spool/cups -g lp -s /bin/false -u 9 lp || echo "user exists"
groupadd -g 19 lpadmin || echo "group exists"

./configure --libdir=/usr/lib            \
            --with-rundir=/run/cups      \
            --with-system-groups=lpadmin \
            --with-docdir=/usr/share/cups/doc-2.4.10
make
make DESTDIR=$LFS_PCK_DIR install

mkdir -p $LFS_PCK_DIR/usr/share/doc
ln -svnf ../cups/doc-2.4.10 $LFS_PCK_DIR/usr/share/doc/cups-2.4.10

mkdir -p $LFS_PCK_DIR/etc/cups
echo "ServerName /run/cups/cups.sock" > $LFS_PCK_DIR/etc/cups/client.conf

mkdir -p $LFS_PCK_DIR/etc/pam.d/
cat > $LFS_PCK_DIR/etc/pam.d/cups << "EOF"
# Begin /etc/pam.d/cups

auth    include system-auth
account include system-account
session include system-session

# End /etc/pam.d/cups
EOF
