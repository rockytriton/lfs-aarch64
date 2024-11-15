
rm -v man3/crypt*
make prefix=/usr DESTDIR=$pckdir install
