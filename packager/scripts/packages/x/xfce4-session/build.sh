./configure --prefix=/usr \
            --sysconfdir=/etc \
            --disable-legacy-sm 
make
make install

update-desktop-database &&
update-mime-database /usr/share/mime
