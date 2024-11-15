
./configure --prefix=/usr 
make

make -C doc html                                                       &&
makeinfo --html --no-split -o doc/gcrypt_nochunks.html doc/gcrypt.texi &&
makeinfo --plaintext       -o doc/gcrypt.txt           doc/gcrypt.texi

make install

install -v -dm755   /usr/share/doc/libgcrypt-1.11.0 &&
install -v -m644    README doc/{README.apichanges,fips*,libgcrypt*} \
                    /usr/share/doc/libgcrypt-1.11.0 &&

install -v -dm755   /usr/share/doc/libgcrypt-1.11.0/html &&
install -v -m644 doc/gcrypt.html/* \
                    /usr/share/doc/libgcrypt-1.11.0/html &&
install -v -m644 doc/gcrypt_nochunks.html \
                    /usr/share/doc/libgcrypt-1.11.0      &&
install -v -m644 doc/gcrypt.{txt,texi} \
                    /usr/share/doc/libgcrypt-1.11.0
                    