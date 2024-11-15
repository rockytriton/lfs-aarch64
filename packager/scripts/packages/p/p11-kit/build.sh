sed '20,$ d' -i trust/trust-extract-compat &&

cat >> trust/trust-extract-compat << "EOF"
# Copy existing anchor modifications to /etc/ssl/local
/usr/libexec/make-ca/copy-trust-modifications

# Update trust stores
/usr/sbin/make-ca -r
EOF


mkdir __build
cd    __build

meson setup --prefix=/usr --buildtype=release -D trust_paths=/etc/pki/anchors
ninja
DESTDIR=$LFS_PCK_DIR ninja install

mkdir -p $LFS_PCK_DIR/usr/bin/
mkdir -p $LFS_PCK_DIR/usr/lib/

ln -sfv /usr/libexec/p11-kit/trust-extract-compat \
        $LFS_PCK_DIR/usr/bin/update-ca-certificates

ln -sfv ./pkcs11/p11-kit-trust.so $LFS_PCK_DIR/usr/lib/libnssckbi.so
