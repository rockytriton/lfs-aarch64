
./configure --prefix=/usr 
make
make html
make install

install -d -m755           /usr/share/doc/sed-4.9
install -m644 doc/sed.html /usr/share/doc/sed-4.9
