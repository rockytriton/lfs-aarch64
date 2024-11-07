
useradd -c "Print Service User" -d /var/spool/cups -g lp -s /bin/false -u 9 lp
groupadd -g 19 lpadmin

./configure --libdir=/usr/lib            \
            --with-rundir=/run/cups      \
            --with-system-groups=lpadmin \
            --with-docdir=/usr/share/cups/doc-2.4.10
make
make install

ln -svnf ../cups/doc-2.4.10 /usr/share/doc/cups-2.4.10

echo "ServerName /run/cups/cups.sock" > /etc/cups/client.conf

cat > /etc/pam.d/cups << "EOF"
# Begin /etc/pam.d/cups

auth    include system-auth
account include system-account
session include system-session

# End /etc/pam.d/cups
EOF

systemctl enable cups
