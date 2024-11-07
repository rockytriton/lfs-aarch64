make PREFIX=/usr           \
     BUILD_STATIC_LIB=0    \
     MANDIR=/usr/share/man \
     EXLDFLAGS=

make PREFIX=/usr        \
     BUILD_STATIC_LIB=0 \
     MANDIR=/usr/share/man install &&

install -v -m755 -d /usr/share/doc/lm_sensors-3-6-0 &&
cp -rv              README INSTALL doc/* \
                    /usr/share/doc/lm_sensors-3-6-0