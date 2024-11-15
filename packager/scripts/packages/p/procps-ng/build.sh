
./configure --prefix=/usr                           \
            --docdir=/usr/share/doc/procps-ng-4.0.4 \
            --disable-static                        \
            --disable-kill                          \
            --with-systemd
make src_w_LDADD='$(LDADD) -lsystemd'
make install

