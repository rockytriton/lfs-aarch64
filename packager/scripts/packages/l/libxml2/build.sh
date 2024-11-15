wget https://www.linuxfromscratch.org/patches/blfs/12.2/libxml2-2.13.3-upstream_fix-2.patch -P ..
patch -Np1 -i ../libxml2-2.13.3-upstream_fix-2.patch

./configure --prefix=/usr           \
            --sysconfdir=/etc       \
            --disable-static        \
            --with-history          \
            --with-icu              \
            PYTHON=/usr/bin/python3 \
            --docdir=/usr/share/doc/libxml2-2.13.3
make
make install

rm -vf /usr/lib/libxml2.la
sed '/libs=/s/xml2.*/xml2"/' -i /usr/bin/xml2-config

