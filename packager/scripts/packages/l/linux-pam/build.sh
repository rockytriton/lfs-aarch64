wget https://github.com/linux-pam/linux-pam/releases/download/v1.6.1/Linux-PAM-1.6.1-docs.tar.xz -P ..

autoreconf -fi
tar -xf ../Linux-PAM-1.6.1-docs.tar.xz --strip-components=1

./configure --prefix=/usr                        \
            --sbindir=/usr/sbin                  \
            --sysconfdir=/etc                    \
            --libdir=/usr/lib                    \
            --enable-securedir=/usr/lib/security \
            --docdir=/usr/share/doc/Linux-PAM-1.6.1
make
make DESTDIR=$LFS_PCK_DIR install
