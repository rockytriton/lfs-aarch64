
make install
install -vdm755 /etc/ssl/local

/usr/sbin/make-ca -g --force

systemctl enable update-pki.timer

mkdir -pv /etc/profile.d &&
cat > /etc/profile.d/pythoncerts.sh << "EOF"
# Begin /etc/profile.d/pythoncerts.sh

export _PIP_STANDALONE_CERT=/etc/pki/tls/certs/ca-bundle.crt

# End /etc/profile.d/pythoncerts.sh
EOF
